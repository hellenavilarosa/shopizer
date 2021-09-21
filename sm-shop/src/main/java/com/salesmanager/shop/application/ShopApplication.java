package com.salesmanager.shop.application;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import software.amazon.codeguruprofilerjavaagent.Profiler;


@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class ShopApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ShopApplication.class);
    }

    public static void main(String[] args) {
				Profiler.builder()
	            .profilingGroupName("shopizer")
							.withHeapSummary(true)
	            .build()
	            .start();
        SpringApplication.run(ShopApplication.class, args);
    }



}
