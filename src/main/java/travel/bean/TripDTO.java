package travel.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class TripDTO {
	private int seq;
	private String id;
	private String countryid;
	private String cityid;
	private String wordname;
	private String citycontent;
	private String cityimage;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy. MM. dd")
	private Date logtime;
	private int type;
	private int ref;
	private String countryid2;
	
}

