package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.foodEntity;

public class foodAction {
	public ArrayList<foodEntity> getList(){
	       
        ArrayList<foodEntity> list = null;
        Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
        try{//실행
        	String SQL = "SELECT * FROM food";  	
    		conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            list = new ArrayList<foodEntity>();
            while(rs.next()){
            	foodEntity user = new foodEntity(
            			rs.getString(1),
            			rs.getString(2),
            			rs.getString(3),
            			rs.getString(4),
            			rs.getString(5)
            			);
            	
                list.add(user);
            }
        }catch(Exception e){          
        	e.printStackTrace();       
        }finally {
			try{if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}  
        return list;
    }//getMemberlist
	
	public ArrayList<foodEntity> getSearchList(String search) {
		ArrayList<foodEntity> searchList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM food WHERE CONCAT(address) LIKE ? ";

			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			searchList = new ArrayList<foodEntity>();
			while (rs.next()) {
				foodEntity review = new foodEntity(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5));
				searchList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return searchList; // 데이터베이스 오류
	}
	public String choicef (String name){
		//ArrayList<Choicemovie> searchList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass=null;
		SQL = "SELECT name,address FROM food WHERE name = ?";
		try {
			
			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
				if(rs.next()){
					if(rs.getString(1).equals(name)){
						//1은 pass
						pass = rs.getString(2);
						//2는 name
					}
			
							
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return pass;// 데이터베이스 오류
	}
	
	public String choicep (String name){
		//ArrayList<Choicemovie> searchList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String phone=null;
		SQL = "SELECT name,phone FROM food WHERE name = ?";
		try {
			
			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
				if(rs.next()){
					if(rs.getString(1).equals(name)){
						//1은 pass
						phone=rs.getString(2);
						//2는 name
					}
			
							
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return phone;// 데이터베이스 오류
	}
	
	public int savefood(Choicefood cfood) {
		String SQL = "INSERT INTO CHOICEFOOD VALUES (?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cfood.getName());
			pstmt.setString(2, cfood.getAddress());
			pstmt.setString(3, cfood.getPhone());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1; //기록실패
	}
	public ArrayList<Choicefood> getsaveFList(){
	       
        ArrayList<Choicefood> list = null;
        Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
        try{//실행
        	String SQL = "SELECT * FROM choicefood";
        	
    		conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            list = new ArrayList<Choicefood>();
            while(rs.next()){
            	Choicefood user = new Choicefood(
            			rs.getString(1),
            			rs.getString(2),
            			rs.getString(3)
            			);
            	
                list.add(user);
            }
        }catch(Exception e){          
        	e.printStackTrace();       
        }finally {
			try{if(conn!=null)conn.close();}catch(Exception e) {e.printStackTrace();}
			try{if(pstmt!=null)pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try{if(rs!=null)rs.close();}catch(Exception e) {e.printStackTrace();}
		}  
        return list;
    }//getMemberlist
	
	public int delete(String name) {
		String SQL = "DELETE FROM choicefood WHERE name = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}
}
