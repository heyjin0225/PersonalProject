package member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String approval_status;
	private String approval_key;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy. MM. dd")
    private Date logtime;
	private int type;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
}
