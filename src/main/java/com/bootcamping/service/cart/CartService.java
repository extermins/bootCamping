package com.bootcamping.service.cart;

import com.bootcamping.domain.DTO.CartDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CartService {
    void addCart(CartDTO cartDTO);
    List<CartDTO> selectCart(int cid);

    List<CartDTO> purchaseCart(String cartIds);

    void deleteCart(int cartid);

}
