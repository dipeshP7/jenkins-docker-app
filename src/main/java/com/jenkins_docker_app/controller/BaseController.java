package com.jenkins_docker_app.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/jdapp")
public class BaseController {

    @GetMapping("/public/init")
    public String getInitMethod(){
        return "project initialise! Good To Go";
    }
}
