package util;

public class Pagination {
	private int pageNum;// һҳ��ʾ����;
	private int begin;// ���㿪ʼҳ;
	private int end;// �������ҳ;
	private int ye;
	private int maxYe;
	private int yeMa;// һҳ��ʾ��������1-5,1-10��

	public Pagination(int ye, int max, int pageNum, int yeMa) {

		this.ye = ye;
		this.pageNum = pageNum;
		this.yeMa = yeMa;
		cal(max);
	}

	public void cal(int max) {
		// ��������¼���������ҳ��
		this.maxYe = max % pageNum == 0 ? max / pageNum : max / pageNum + 1;

		// ��֤��С��ҳ�ǵ�һҳ
		if (ye < 1) {
			ye = 1;
		}
		// ��֤���һҳ������ҳ
		if (ye > maxYe) {
			ye = maxYe;
		}

		// �õ�ǰѡ��ҳ����ʾ���м�
		begin = ye - yeMa / 2;
		end = ye + yeMa / 2;
		// ����ҳ����1��2�����
		if (begin < 1) {
			begin = 1;
			end = yeMa;
		}
		// ����ҳ���ǵ���1,2�����
		if (end > maxYe) {
			end = maxYe;
			begin = end - yeMa + 1;
		}
		// �������ҳ������5�����
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
