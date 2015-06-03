package chiron.diluka.demo.dialog_demo_with_bui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class DialogDemoWithBuiApplication extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(DialogDemoWithBuiApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(DialogDemoWithBuiApplication.class, args);
    }


}
