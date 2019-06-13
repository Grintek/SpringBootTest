package ru.example.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.example.test.domain.Channel;
import ru.example.test.domain.User;
import ru.example.test.repos.ChannelRepo;

import java.util.Map;

@Controller
public class ResourceController {
@Autowired

    private ChannelRepo channelRepo;

    @GetMapping("/resource")
    public String resource(@RequestParam(name = "name", required = false) String name,
                           @RequestParam(name = "user", required = false) String user,
                           Map<String, Object> model)
    {
        Iterable<Channel> channels = channelRepo.findAll();
        model.put("channel", channels);
        model.put("name", "Name");
        model.put("user", "User");

        return "resource";
    }
    //добавление видео с названием
    @PostMapping("addchan")
    public String addchannel(@AuthenticationPrincipal User user, @RequestParam String chn_url, @RequestParam String name, Map<String, Object> model){
        Channel channel = new Channel(chn_url, name, user);

        if(chn_url != null & name != null) {
            channelRepo.save(channel);
        }

        return "redirect:/main";
    }
}
