package cn.smbms.dao;

import cn.smbms.entity.Userinfo;

import java.util.List;
import java.util.Map;

public interface IUserinfoDAO {
    //登录方法
    public Userinfo isLogin(Userinfo userinfo);
    //查询所有用户信息
   // public List<Userinfo> findAll();
    //获取一页数据
    public List<Userinfo> getOnePageData(Map<String, Object> map);
    //获取总记录数
    public Integer getTotalRecords();
    //获取带条件的总记录数
    public Integer getTotalRecordsByCondition(String userName);
    //增加用户的方法
    /*public int addUser(Userinfo userinfo);
    //修改用户的方法
    public int updateUser(Userinfo userinfo);*/



}
