package date;

import java.util.Date;
import java.util.Random;
import java.text.SimpleDateFormat;

public class CreateId {
	public String dateTime0(){
		String dt="";
		Date now=new Date();
		SimpleDateFormat dfn=new SimpleDateFormat("yyyy-MM-dd hh:mm");
		dt=dfn.format(now).toString();
		return dt;
	}
	
	public String dateTime1(){
		String dt="";
		Date now=new Date();
		SimpleDateFormat dfn=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		dt=dfn.format(now).toString();
		return dt;
	}
	
	public String dateTime2(){
		String asub="";
		String bsub="";
		String tin="";
		tin=this.dateTime1();
		asub=tin.substring(0,4);bsub=bsub.concat(asub+"年");
		asub=tin.substring(5,7);bsub=bsub.concat(asub+"月");
		asub=tin.substring(8,10);bsub=bsub.concat(asub+"日");
		asub=tin.substring(11,13);bsub=bsub.concat(asub+"时");
		asub=tin.substring(14,16);bsub=bsub.concat(asub+"分");
		asub=tin.substring(17,19);bsub=bsub.concat(asub+"秒");
		//日期时间
		return bsub;	
	}
	
	public String dateTimeToId(){
		int i=0,k=0;
		String asub="";String tin="";
		StringBuilder bsub=new StringBuilder();
		tin=this.dateTime1();
		for(i=2,k=4;i<19;i=i+3,k=k+3){
			asub=tin.substring(i,k);
			bsub.append(asub);
		}
		return bsub.toString();
	}
	
	
	public String dateToId(){
		String asub="",tin="";
		StringBuilder bsub=new StringBuilder();
		int i=0,k=0;
		tin=this.dateTime1();
		for(i=2,k=4;i<11;i=i+3,k=k+3){
			asub=tin.substring(i,k);
			bsub.append(asub);
		}
		return bsub.toString();
	}
	
	public String createRand(){
		StringBuilder srand=new StringBuilder();
		String rand="";
		Random random=new Random();
		for(int i=0;i<5;i++){
			rand=String.valueOf(random.nextInt(10));
			srand.append(rand);
		}
		return  srand.toString();
	}
}
