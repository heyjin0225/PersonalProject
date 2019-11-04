package travel.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class HeartDTO {
	private int heart_no;
	private String heart_id;
	private String heart_check;
}
