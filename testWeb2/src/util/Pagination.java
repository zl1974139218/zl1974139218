package util;

public class Pagination {
	private int pageNum;// 一页显示几条;
	private int begin;// 换算开始页;
	private int end;// 换算结束页;
	private int ye;
	private int maxYe;
	private int yeMa;// 一页显示几个，如1-5,1-10；

	public Pagination(int ye, int max, int pageNum, int yeMa) {

		this.ye = ye;
		this.pageNum = pageNum;
		this.yeMa = yeMa;
		cal(max);
	}

	public void cal(int max) {
		// 根据最大记录数，换算出页数
		this.maxYe = max % pageNum == 0 ? max / pageNum : max / pageNum + 1;

		// 保证最小的页是第一页
		if (ye < 1) {
			ye = 1;
		}
		// 保证最后一页是最大的页
		if (ye > maxYe) {
			ye = maxYe;
		}

		// 让当前选中页，显示在中间
		begin = ye - yeMa / 2;
		end = ye + yeMa / 2;
		// 控制页码是1，2的情况
		if (begin < 1) {
			begin = 1;
			end = yeMa;
		}
		// 控制页码是倒数1,2的情况
		if (end > maxYe) {
			end = maxYe;
			begin = end - yeMa + 1;
		}
		// 控制最大页，不足5的情况
		if (maxYe < yeMa) {
			begin = 1;
			end = maxYe;
		}
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getYe() {
		return ye;
	}

	public void setYe(int ye) {
		this.ye = ye;
	}

	public int getMaxYe() {
		return maxYe;
	}

	public void setMaxYe(int maxYe) {
		this.maxYe = maxYe;
	}

}
