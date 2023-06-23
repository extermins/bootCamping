package com.bootcamping;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class BootCampingApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootCampingApplication.class, args);
    }

}
