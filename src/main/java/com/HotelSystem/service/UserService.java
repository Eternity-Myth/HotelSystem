package com.HotelSystem.service;

import com.HotelSystem.dto.CheckResult;
import com.HotelSystem.dto.UserSignInResult;
import com.HotelSystem.dto.UserSignUpResult;
import com.HotelSystem.entity.User;
import com.HotelSystem.vo.UserSignInForm;
import com.HotelSystem.vo.UserSignUpForm;

import java.util.List;

/**
 * User的业务逻辑接口
 *
 * @author 关文聪
 * @version 1.0
 * @email 530711667@qq.com
 */

public interface UserService {
    UserSignUpResult signUp(UserSignUpForm userSignUpForm, String codeSession);

    CheckResult checkUserNameIsExist(String userName);

    CheckResult checkUserEmailIsExist(String userEmail);

    UserSignInResult signIn(UserSignInForm userSignInForm, String codeSession);

    public List<User> getAll();

    public void deleteBatch(List<Integer> del_ids);

    public void deleteUser(Integer id);

    public void changeStatus(User user);

    public User getUserByName(String name);
}
