package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;


@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    @Min(value = 1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(value = 10)
    @Max(value = 1000)
    @Positive
    private int size = 10;



    public int getSkip(){
        return (page - 1) * size;
    }

    private String link;


    public String getLink(){
        if(link == null) {
            StringBuilder builder = new StringBuilder();
            builder.append("page=" +this.page);
            builder.append("&size="+this.size);

//            if (this.finished){
//                builder.append("&finished=on");
//            }
            if (this.types !=null && this.types.length >0){
                for (int i =0;i<this.types.length; i++){
                    builder.append("&types=" +types[i]);
                }
            }
            if (keyword !=null){
                try{
                    builder.append("&keyword=" + URLEncoder.encode(keyword,"UTF-8"));
                }catch (UnsupportedEncodingException e){
                    e.printStackTrace();
                }
            }

            if (this.from != null){
                builder.append("&from=" + from.toString());
            }
            if (this.to != null){
                builder.append("&to=" + to.toString());
            }

            link = builder.toString();
        }
        return link;
    }


    private String[] types;
    private String keyword;
//    private boolean finished;
    private LocalDate from;
    private LocalDate to;

    public boolean checkType(String type){
        if (this.types == null || this.types.length == 0){
            return false;
        }
        return Arrays.asList(this.types).contains(type);
    }
}
