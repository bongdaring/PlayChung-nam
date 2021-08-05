package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class movieAction {
	public ArrayList<movieEntity> getList(){
	       
        ArrayList<movieEntity> list = null;
        Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
        try{//실행
        	String SQL = "SELECT * FROM movie";
        	
    		conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            list = new ArrayList<movieEntity>();
            while(rs.next()){
            	movieEntity user = new movieEntity(
            			rs.getString(2),
            			rs.getString(3),
            			rs.getString(4)
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
	
	public ArrayList<movieEntity> getSearchList(String search) {
		ArrayList<movieEntity> searchList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM movie WHERE CONCAT(address) LIKE ? ";

			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			searchList = new ArrayList<movieEntity>();
			while (rs.next()) {
				movieEntity review = new movieEntity(rs.getString(2), rs.getString(3), rs.getString(4));
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
	
	public String choicem (String name){
		//ArrayList<Choicemovie> searchList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass=null;
		SQL = "SELECT name,address FROM movie WHERE name = ?";
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
		} 
		
		finally {
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
		return pass; // 데이터베이스 오류
	}
	
	public int savemovie(Choicemovie cmovie) {
		String SQL = "INSERT INTO CHOICEMOVIE VALUES (?,?)";
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		try {
			conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cmovie.getName());
			pstmt.setString(2, cmovie.getAddress());
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
	
	public ArrayList<Choicemovie> getsaveMList(){
	       
        ArrayList<Choicemovie> list = null;
        Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
        try{//실행
        	String SQL = "SELECT * FROM choicemovie";
        	
    		conn = Databaseuser.getConnection();
			pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            list = new ArrayList<Choicemovie>();
            while(rs.next()){
            	Choicemovie user = new Choicemovie(
            			rs.getString(1),
            			rs.getString(2)
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
		String SQL = "DELETE FROM CHOICEMOVIE WHERE name = ?";
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
