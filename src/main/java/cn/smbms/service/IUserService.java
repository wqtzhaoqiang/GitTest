package cn.smbms.service;

import cn.smbms.entity.Userinfo;
import cn.smbms.util.PageUtil;


public interface IUserService {
    //登录方法
    public Userinfo isLogin(Userinfo userinfo);
    //查询所有用户信息
    //public List<Userinfo> findAll();
    //获取单页数据
    public PageUtil<Userinfo> getOnePageData(int pageIndex, int pageSize,Userinfo userinfo);
    //获取总记录数
    public Integer getTotalRecords();
    //获取带条件的总记录数
    public Integer getTotalRecordsByCondition(String userName);
    //增加用户的方法
   /* public boolean addUser(Userinfo userinfo);
    //修改用户的方法
    public boolean updateUser(Userinfo userinfo);*/
}
