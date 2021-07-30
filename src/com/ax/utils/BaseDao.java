package com.ax.utils;

import java.sql.*;

/**
 * Created by Joe on 2021-4-29
 */
public class BaseDao {
    private static String driver="com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/gongdan?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
    private String user = "root";
    private String pwd = "root";
    public Connection conn = null;
    public ResultSet rs = null;
    public PreparedStatement pstmt = null;
    static {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public Connection getConn(){
        try {
            if(conn==null||conn.isClosed()){
                conn= DriverManager.getConnection(url,user,pwd);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return conn;
    }

    public void closeAll(Connection conn,Statement stmt,ResultSet rs){
        try {
            if(rs!=null) rs.close();
            if(stmt!=null) stmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int update(String sql,Object... params){
        int row = 0;
        try {
            pstmt=getConn().prepareStatement(sql);
            if(params!=null){
                for(int i = 0;i < params.length;i++){
                    pstmt.setObject(i+1,params[i]);
                }
            }
            row = pstmt.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            closeAll(conn,pstmt,null);
        }
        return row;
    }

    public ResultSet query(String sql,Object... params){
        ResultSet rs = null;
        try {
            pstmt=getConn().prepareStatement(sql);
            if(params!=null){
                for(int i = 0;i < params.length;i++){
                    pstmt.setObject(i+1,params[i]);
                }
            }
            rs = pstmt.executeQuery();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rs;
    }
}
