package chiron.diluka.demo.dialog_demo_with_bui.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Diluka on 2015-06-04.
 */
@RestController
public class DemoSaveController {
    @RequestMapping(value = "demoSave",produces = MediaType.APPLICATION_JSON_VALUE)
    public Object demoSave(@RequestParam Integer code){
        Map<String,Object> map=new HashMap<>();

        map.put("success",true);
        map.put("code",code);

        return map;
    }
}
