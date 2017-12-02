package cn.smbms.service.serviceimpl;

import cn.smbms.dao.IUserinfoDAO;
import cn.smbms.entity.Userinfo;
import cn.smbms.service.IUserService;
import cn.smbms.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("UserService")
public class Userinfoimpl implements IUserService {
    //dao层对象
    @Resource(name = "IUserinfoDAO")
    private IUserinfoDAO userinfoDAO;
    public Userinfo isLogin(Userinfo userinfo) {
        return userinfoDAO.isLogin(userinfo);
    }
   /* public List<Userinfo> findAll() {
        return userinfoDAO.findAll();
    }*/
    public PageUtil<Userinfo> getOnePageData(int pageIndex, int pageSize, Userinfo userinfo) {
        System.out.println("获取用户名到控制台："+userinfo.getUserName());
        //业务逻辑层 ：  将pageIndex和pageSize封装在Map集合
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageIndex",(pageIndex-1)*pageSize);
        map.put("pageSize",pageSize);
        if (userinfo!=null&&userinfo.getUserName()!=null){
            //用户填写了用户名
            map.put("userName",userinfo.getUserName());
        }
        PageUtil<Userinfo> pageUtil=new PageUtil<Userinfo>();
        pageUtil.setPageIndex(pageIndex);
        pageUtil.setPageSize(pageSize);
        //总记录数
        if (userinfo!=null&&userinfo.getUserName()!=null){
            //用户填写了用户名  取的是带条件的总记录数
            pageUtil.setTotalRecords(getTotalRecordsByCondition(userinfo.getUserName()));
        }else{
            pageUtil.setTotalRecords(getTotalRecords());
        }
        //总页数
        pageUtil.setTotalPages(pageUtil.getTotalRecords()%pageUtil.getPageSize()==0?pageUtil.getTotalRecords()/pageUtil.getPageSize():pageUtil.getTotalRecords()/pageUtil.getPageSize()+1);
        //集合 放入pageUtil
        List<Userinfo> list = userinfoDAO.getOnePageData(map);
        pageUtil.setList(list);
        return pageUtil;
    }


    public Integer getTotalRecords() {
        return userinfoDAO.getTotalRecords();
    }
    public Integer getTotalRecordsByCondition(String userName) {
        return userinfoDAO.getTotalRecordsByCondition(userName);
    }

    /*//添加用户
    public boolean addUser(Userinfo userinfo) {
        int count = userinfoDAO.addUser(userinfo);
        if (count>0){
            return true;
        }else{
            return false;
        }
    }
    //修改用户信息
    public boolean updateUser(Userinfo userinfo) {
        int count = userinfoDAO.updateUser(userinfo);
        if (count>0){
            return true;
        }else{
            return false;
        }

    }*/

}
