package com.bootcamping.domain.DTO;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
import lombok.extern.log4j.Log4j2;

import java.util.List;

@Getter
@ToString
@Log4j2
public class PageResponseDTO<E>{
    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total){
        log.info(pageRequestDTO);
        log.info("tatal : " + total);

        this.page = pageRequestDTO.getPage();
        this.size = pageRequestDTO.getSize();

        this.total = total;
        this.dtoList = dtoList;

        this.end = (int) (Math.ceil(this.page / 10.0)) * 10;
        this.start = this.end - 9;

        int last = (int)(Math.ceil((total/(double)size)));
        this.end = end > last ? last : end;


        this.prev = this.start > 1;
        this.next = total > this.end * this.size;



        this.startNo = Long.valueOf(total - (this.page -1) * size);
    }

    private int page;
    private int size;
    private int total;

    //시작 페이지 번호
    private int start;
    //끝페이지 번호
    private int end;

    //이전 페이지의 존재여부
    private boolean prev;
    //다음페이지 존재여부
    private boolean next;

    private Long startNo;

    private List<E> dtoList;

}
