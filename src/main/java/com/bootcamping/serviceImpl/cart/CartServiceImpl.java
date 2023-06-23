package com.bootcamping.serviceImpl.cart;

import com.bootcamping.domain.DTO.CartDTO;
import com.bootcamping.domain.VO.CartVO;
import com.bootcamping.mapper.cart.CartMapper;
import com.bootcamping.service.cart.CartService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Log4j2
@Service
@RequiredArgsConstructor

public class CartServiceImpl implements CartService {
    private final ModelMapper modelMapper;
    private final CartMapper cartMapper;

    @Override
    public void addCart(CartDTO cartDTO) {
        CartVO cartVO = modelMapper.map(cartDTO,CartVO.class);
        cartMapper.insertCart(cartVO);
    }

    @Override
    public List<CartDTO> selectCart(int cid) {
        List<CartVO> vos = cartMapper.selectCart(cid);
        List<CartDTO> dtos = new ArrayList<>();
        log.info(vos);
        for (CartVO cartVO : vos){
            CartDTO dto = modelMapper.map(cartVO,CartDTO.class);
            dtos.add(dto);
        }
        log.info("-------------------------------------------------------------------------");
        log.info(dtos);
        return dtos;
    }

    @Override
    public List<CartDTO> purchaseCart(String cartIds) {
        String[] parseResult = cartIds.split(" ");
        List<CartDTO> list = new ArrayList<>();
        for(String a : parseResult){
            int c = Integer.parseInt(a.trim());
            CartDTO dto = cartMapper.purchaseCart(c);
            list.add(dto);
        }
        return list;
    }

    @Override
    public void deleteCart(int cartid) {
        cartMapper.deleteCart(cartid);
    }
}
