package db_tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AboutSQL {
	private String DB_DRIVER="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String DB_USER="sa";
	private String DB_PASSWORD="thj981786337";
	private String DEFAULT_URL="jdbc:sqlserver://localhost:1433;DatabaseName=Test";
	
	private Connection con=null;
	private Statement st=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;
	
	public AboutSQL(){
		try{
			Class.forName(DB_DRIVER);
		}catch(ClassNotFoundException e){
			System.out.println("Error loading Driver,不能加载数据库驱动");
		}
		
		try{
			con=DriverManager.getConnection(DEFAULT_URL,DB_USER,DB_PASSWORD);
		}catch(SQLException e){
			System.out.println("Error getConnection,不能连接数据库");
		}
		try{
			con.setAutoCommit(false);
		}catch(SQLException e){
			System.out.println("不能设置非自动提交");
		}
	}
	
	public boolean executeInsertOrder(String orderId,
			String userId,
			String storeId,
			String foodId,
			int num,
			String time){
		boolean flag=false;
		try{
			if(ps==null) ps=con.prepareStatement("insert into create_orders_view values(?,?,?,?,?,?)");
			ps.setString(1,orderId);
			ps.setString(2, userId);
			ps.setString(3,storeId);
			ps.setString(4,foodId);
			ps.setInt(5,num);
			ps.setString(6,time);
			ps.executeUpdate();
			con.commit();
			flag=true;
		}catch(SQLException e){
			try {
                //发现异常，及时回滚
                con.rollback();
            } catch (SQLException e1) {
                throw new RuntimeException("回滚失败");
            }
            e.printStackTrace();
		}
		return flag;
	}
	
	public void execute(String sql){
		try{
			if(null==st)
			st=con.createStatement();
			st.execute(sql);
			con.commit();
		}catch(SQLException e){
			try {
                //发现异常，及时回滚
                con.rollback();
            } catch (SQLException e1) {
                throw new RuntimeException("回滚失败");
            }
            e.printStackTrace();
        }
	}
	
	public boolean executeBatch(String... sql)
	{
		boolean flag=false;
		try{
		if(null==st) st=con.createStatement();
		for(String sq:sql){
			st.addBatch(sq);
		}
		st.executeBatch();
		con.commit();
		flag=true;
		}catch(SQLException e){
			try {
                // 发现异常，及时回滚
                con.rollback();
            } catch (SQLException e1) {
                throw new RuntimeException("回滚失败");
            }
			e.printStackTrace();
		}
		return flag;
	}
	
	public ResultSet executeQuery(String sql){
		try{
			if(null==st) 
			st=con.createStatement();
			rs=st.executeQuery(sql);
			con.commit();
		}catch(SQLException e){
			try {
                // 发现异常，及时回滚
                con.rollback();
            } catch (SQLException e1) {
                throw new RuntimeException("回滚失败");
            }
			e.printStackTrace();
		}
		return rs;
	}
	
	
	
	public boolean executeUpdate(String sql){
		boolean flag=false;
		try{
			if(null==st) st=con.createStatement();
			st.executeUpdate(sql);
			con.commit();
			flag=true;
		}catch(SQLException e){
			try {
                //发现异常，及时回滚
                con.rollback();
            } catch (SQLException e1) {
                throw new RuntimeException("回滚失败");
            }
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public void close(){
		try{
			if(rs!=null) rs.close();
			if(st!=null) st.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
