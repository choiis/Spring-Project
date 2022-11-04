package com.singer.bean;

import com.fasterxml.jackson.core.JsonEncoding;
import com.singer.view.BlobDownloadView;
import com.singer.view.FileDownloadView;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class ViewConfigs {

    @Bean(name = "viewNameResolver")
    public BeanNameViewResolver nameViewResolver() {
        BeanNameViewResolver nameViewResolver = new BeanNameViewResolver();
        nameViewResolver.setOrder(0);
        return nameViewResolver;
    }

    @Bean(name = "jsonView")
    public MappingJackson2JsonView jsonView() {
        MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
        jsonView.setEncoding(JsonEncoding.UTF8);
        jsonView.setContentType(MediaType.APPLICATION_JSON_VALUE);
        return jsonView;
    }

    @Bean(name = "filedownloadView")
    public FileDownloadView fileDownloadView() {
        return new FileDownloadView();
    }

    @Bean(name = "blobdownloadView")
    public BlobDownloadView blobDownloadView() {
        return new BlobDownloadView();
    }
}
