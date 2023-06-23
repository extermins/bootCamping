package com.bootcamping.controller.payment;

import com.bootcamping.domain.DTO.CartDTO;
import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.DTO.OrderDTO;
import com.bootcamping.domain.DTO.PaymentDTO;
import com.bootcamping.service.cart.CartService;
import com.bootcamping.service.menu.MenuService;
import com.bootcamping.service.order.OrderService;
import com.bootcamping.service.payment.PaymentService;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/toss")
public class PayController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CartService cartService;
    @Autowired
    private MenuService menuService;

    @PostMapping("/payment")
    public String tossController(HttpSession session,OrderDTO orderDTO){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        List<CartDTO> cartDTO = (List<CartDTO>) session.getAttribute("payment");
        log.info("결제단계에서의 멤버 : " + memberDTO);
        log.info("결제단계에서의 카트 : " + cartDTO);

        if (memberDTO == null){
            return "redirect:/member/login";
        }
        if (cartDTO == null){
            return "redirect:/cart/mycart";
        }
        orderDTO.setMemberId(memberDTO.getMid());
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        String formattedDate = currentDate.format(formatter);
        log.info("오늘 날짜" + formattedDate);

        String tossid = formattedDate + UUID.randomUUID().toString().substring(0,8) +memberDTO.getId();

        int totalPrice = 0;
        for(CartDTO c : cartDTO){
            totalPrice += c.getPrice() * c.getAmount();
        }

//
//        if(cartDTO.size()>1){
//            orderDTO.setOrderId(orderId);
//            orderDTO.setOrderItem(cartDTO.get(0).getName()+"외"+(cartDTO.size()-1)+"개");
//
//            for (int i =0; i<cartDTO.size();i++){
//                total_price += cartDTO.get(i).getAmount() * cartDTO.get(i).getPrice();
//            }
//            orderDTO.setOrderItemPrice(total_price);
//        }else {
//            orderDTO.setOrderId(orderId);
//            orderDTO.setOrderItem(cartDTO.get(0).getName());
//            total_price = cartDTO.get(0).getAmount() * cartDTO.get(0).getPrice();
//            orderDTO.setOrderItemPrice(total_price);
//        }

        log.info("최종 orderDTO : " + orderDTO);
        session.setAttribute("tossid",tossid);
        session.setAttribute("totalPrice",totalPrice);
        session.setAttribute("orderDTO",orderDTO);
        return "payment/toss";
    }





// 토스 성공시
    @GetMapping(value = "success")
    public String paymentResult(
            Model model,
            HttpSession session,
            @RequestParam(value = "orderId") String orderId,
            @RequestParam(value = "amount") Integer amount,
            @RequestParam(value = "paymentKey") String paymentKey) throws Exception {

        OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
        log.info("결제단계에서의 orderDTO : "  + orderDTO);
        List<CartDTO> cartDTO = (List<CartDTO>) session.getAttribute("payment");


        PaymentDTO paymentDTO = new PaymentDTO();
        paymentDTO.setPaymentid(orderId);
        paymentDTO.setAmount(amount);



        String secretKey = "test_sk_qLlDJaYngrolgBRQKqG8ezGdRpXx:";

        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
        String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

        URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Authorization", authorizations);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        JSONObject obj = new JSONObject();
        obj.put("orderId", orderId);
        obj.put("amount", amount);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));

        int code = connection.getResponseCode();
        boolean isSuccess = code == 200 ? true : false;
        model.addAttribute("isSuccess", isSuccess);

        InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();


        //json 데이터 받아오는 구문입니다. 이구문의 경우에는 토스 측에서 넘어오는 정보가 담겨있으므로 해당 정보에 맞게 DB를 구성하여 주시기 바랍니다.
        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
        responseStream.close();
        model.addAttribute("responseStr", jsonObject.toJSONString()); // 이 줄같은 경우에 json데이터를 문자열로 변화시켜 줍니다. 변화시켜준 이후에는 model에 담아서 값을 넘겨줄 준비를 하여줍니다.
        System.out.println(jsonObject.toJSONString());

        paymentDTO.setMoinformation(jsonObject.toJSONString());
        paymentDTO.setPaymethod(jsonObject.get("method").toString());

        model.addAttribute("method", (String) jsonObject.get("method"));
        model.addAttribute("orderName", (String) jsonObject.get("orderName"));
        model.addAttribute("price",(Long)jsonObject.get("totalAmount"));

        if (((String) jsonObject.get("method")) != null) {
            if (((String) jsonObject.get("method")).equals("카드")) {
                model.addAttribute("cardNumber", (String) ((JSONObject) jsonObject.get("card")).get("number"));
            } else if (((String) jsonObject.get("method")).equals("가상계좌")) {
                model.addAttribute("accountNumber", (String) ((JSONObject) jsonObject.get("virtualAccount")).get("accountNumber"));
            } else if (((String) jsonObject.get("method")).equals("계좌이체")) {
                model.addAttribute("bank", (String) ((JSONObject) jsonObject.get("transfer")).get("bank"));
            } else if (((String) jsonObject.get("method")).equals("휴대폰")) {
                model.addAttribute("customerMobilePhone", (String) ((JSONObject) jsonObject.get("mobilePhone")).get("customerMobilePhone"));
            }
        } else {
            model.addAttribute("code", (String) jsonObject.get("code"));
            model.addAttribute("message", (String) jsonObject.get("message"));
        }

        paymentService.insertPayment(paymentDTO);

        for(CartDTO c : cartDTO){
            orderDTO.setOrderItem(c.getName());
            orderDTO.setPrice(c.getPrice());
            orderDTO.setAmount(c.getAmount());
            orderDTO.setTossOrderId(orderId);
            orderDTO.setTossOrderId(paymentDTO.getPaymentid());
            orderDTO.setMenuid(c.getMenuid());
            orderService.insertOrder(orderDTO);
            menuService.discountMenuAmount(c.getMenuid(),c.getAmount());
            menuService.updateSalesRate(c.getAmount(),c.getMenuid());
        }


//      여기서 peymentDTO를 지정해주고 DB에 넣어주는 작업을 실행합니다.
        String cartid =(String) session.getAttribute("cartid");
        log.info("카트 아이디 : "+cartid);
        String[] parseResult = cartid.split(" ");

        for (String a:parseResult){
            cartService.deleteCart(Integer.parseInt(a));
        }
        log.info("payment입니다. : " + paymentDTO);

        orderService.updatePayCheck(orderId);


        return "payment/success";
    }

    @GetMapping(value = "fail")
    public String paymentResult(
            Model model,
            @RequestParam(value = "message") String message,
            @RequestParam(value = "code") Integer code
    ) throws Exception {

        model.addAttribute("code", code);
        model.addAttribute("message", message);

        return "fail";
    }


}
