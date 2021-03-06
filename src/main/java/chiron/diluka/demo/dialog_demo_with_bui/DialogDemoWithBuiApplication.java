package chiron.diluka.demo.dialog_demo_with_bui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
public class DialogDemoWithBuiApplication extends SpringBootServletInitializer {

    @RequestMapping(value = "demoSave",produces = MediaType.APPLICATION_JSON_VALUE)
    public Object demoSave(@RequestParam Integer code){
        Map<String,Object> map=new HashMap<>();

        map.put("success",true);
        map.put("code",code);

        return map;
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(DialogDemoWithBuiApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(DialogDemoWithBuiApplication.class, args);
    }


}
