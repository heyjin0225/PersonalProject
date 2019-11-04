package travel.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class TripPaging {
	private int currentPage;//현재페이지
	private int pageBlock;//[이전][1][2][3][다음]
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+(pageSize-1))/pageSize;//총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<a id='paging' href='domestic.do?pg="+(startPage-1)+"'>이전</a>");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {//현재페이지라면
				pagingHTML.append("<a id='currentPaging' style='padding-right:5px;' href='domestic.do?pg="+i+"'>"+i+"</a>");
			}else {
				pagingHTML.append("<a id='paging' style='padding-right:5px;' href='domestic.do?pg="+i+"'>"+i+"</a>");
			}
		}
		if(endPage < totalP) {
			pagingHTML.append("<a id='paging' href='domestic.do?pg="+(endPage+1)+"'>다음</a>");
		}
	}

	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+(pageSize-1))/pageSize;//총페이지수
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock) {
			pagingHTML.append("<span id='paging' style='cursor:pointer;' onclick='boardSearch("+(startPage-1)+")'>이전</span>");
		}
		
		for(int i=startPage; i<=endPage; i++) {
			if(i == currentPage) {//현재페이지라면
				pagingHTML.append("<span id='currentPaging' style='cursor:pointer;' onclick='boardSearch("+i+")'>"+i+"</span>");
			}else {
				pagingHTML.append("<span id='paging' style='cursor:pointer;' onclick='boardSearch("+i+")'>"+i+"</span>");
			}
		}
		if(endPage < totalP) {
			pagingHTML.append("<span id='paging' style='cursor:pointer;' onclick='boardSearch("+(endPage+1)+")'>다음</span>");
		}
	}
}
