package cn.smbms.controller;

import cn.smbms.entity.Userinfo;
import cn.smbms.service.IUserService;
import cn.smbms.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static org.apache.ibatis.ognl.DynamicSubscript.all;

@Controller
public class UserController {
    //注入service
    @Resource(name = "UserService")
    private IUserService userService;

    //添加 修改 用户信息
   /* @ResponseBody
    @RequestMapping("/addUser")
    public Object doAdd(Userinfo userinfo,HttpSession session){
        boolean flag = false;
        System.out.println(userinfo.getId()+"id-------------------");
        if (userinfo.getId() == null) {
            System.out.println("add+-----------------");
            Userinfo u = (Userinfo) session.getAttribute("userinfo");
            userinfo.setCreatedBy(u.getId());
            userinfo.setCreationDate(new Date());
            flag = userService.addUser(userinfo);
        }else {
            flag = userService.updateUser(userinfo);
        }
        return flag;
    }*/

    //02显示用户列表
    @RequestMapping("/userList")
    @ResponseBody
    //返回json格式的数据，向浏览器发送的数据，不再是一个页面，仅仅有数据。将data放到特定区域
    public Object userList(@RequestParam(defaultValue = "1",value = "page") int pageIndex,@RequestParam(defaultValue = "2",value = "rows") int pageSize,Userinfo userinfo){
        //显示所有用户信息
        //List<Userinfo> all = userService.findAll();
        PageUtil<Userinfo> pageUtil = userService.getOnePageData(pageIndex, pageSize,userinfo);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("total",pageUtil.getTotalRecords());
        map.put("rows",pageUtil.getList());
        return map;
    }
    //01登录
    @RequestMapping("/isLogin")
    public String login(Userinfo userinfo){
        Userinfo user = userService.isLogin(userinfo);
        if(user!=null&&!user.getUserName().equals("")){
            //登录成功
            System.out.println("login.jsp");
            return "/jsp/welcome.jsp";
        }else{
            //登录失败
            System.out.println("-----------wel.jsp----");
            return "/jsp/login.jsp";
        }
    }
}
