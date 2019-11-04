package info.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class InfoDTO {
	private int seq;
	private String id;
	private String name;
	private String email;
	private String subject;
	private String content;
	private String reply;
	private int ref;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date logtime;
}
