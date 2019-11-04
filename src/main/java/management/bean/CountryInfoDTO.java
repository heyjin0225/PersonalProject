package management.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CountryInfoDTO {
	private String countryid; 
	private String countryid2;
	private String cityid;
	private String wordname;
	private String cityimage1;
	private String cityimage2;
	private String cityimage3;
	private String cityimage4;
	private String cityimage5;
	private String cityaddr;
	private String latitud;
	private String longitude;
	private String cityinfo;
	private String climate;
	private String travelinfo;
	private String visa;
}
