package com.zking.crm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/input")
public class InputController {

    public InputController() {
        super();
    }

    @RequestMapping("/{page}")
    public String toPage(@PathVariable String page) {
        System.out.println("toPage");
        return page;
    }

    @RequestMapping("/{dir}/{page}")
    public String doDirOfPage(@PathVariable String dir,
                              @PathVariable String page) {
        System.out.println("doDirOfPage");
        String path = dir + "/" + page;
        return path;
    }

    @RequestMapping("/{dir}/{dir2}/{page}")
    public String doDirOfPage(@PathVariable String dir, @PathVariable String dir2,
                              @PathVariable String page) {
        System.out.println("doDirOfPage");
        String path = dir + "/" + dir2 + "/" + page;
        return path;
    }

}
