<?php
namespace Home\Controller;
use Think\Controller;
class MemberController extends Controller 
{
	public function qqlogin()
	{
		// 取出这个openid对应的账号
		$memberModel = D('Admin/Member');
		$member = $memberModel->field('username')->where(array(
			'openid' => $_SESSION['openid'],
		))->find();
		// 如果有关联账号直接让这个账号登录 
		if($member)
		{
			$memberModel->$member['username'];
			if($memberModel->login(FALSE))
			{
					// 默认跳转地址
    				$returnUrl = U('/');  
    				// 如果session中有一个要跳转的地址就跳过去
    				$ru = session('returnUrl');
    				if($ru)
    				{
    					session('returnUrl', null);
    					$returnUrl = $ru;
    				}
    				$this->success('登录成功！',$returnUrl);
    				exit;
			}
			else 
				$this->error($memberModel->getError());
		}
		else 
			// 如果QQ号还没有关联账号那么就引导会员绑定一个账号
			redirect(U('login'));
	}
	public function ajaxChkLogin()
	{
		if(session('m_id'))
			echo json_encode(array(
				'login' => 1,
				'username' => session('m_username'),
			));
		else 
			echo json_encode(array(
				'login' => 0,
			));
	}
	// 制作验证码
	public function chkcode()
	{
		$Verify = new \Think\Verify(array(
		    'fontSize'    =>    30,    // 验证码字体大小
		    'length'      =>    2,     // 验证码位数
		    'useNoise'    =>    TRUE, // 关闭验证码杂点
		));
		$Verify->entry();
	}
    public function login()
    {
    	if(IS_POST)
    	{
    		$model = D('Admin/Member');
    		if($model->validate($model->_login_validate)->create())
    		{
    			if($model->login())
    			{
    				// 默认跳转地址
    				$returnUrl = U('/');  
    				// 如果session中有一个要跳转的地址就跳过去
    				$ru = session('returnUrl');
    				if($ru)
    				{
    					session('returnUrl', null);
    					$returnUrl = $ru;
    				}
    				$this->success('登录成功！',$returnUrl);
    				exit;
    			}
    		}
    		$this->error($model->getError());
    	}
    	// 设置页面信息
    	$this->assign(array(
    		'_page_title' => '登录',
    		'_page_keywords' => '登录',
    		'_page_description' => '登录',
    	));
    	$this->display();
    }
    
    public function regist()
    {
    	if(IS_POST)
    	{
    		$model = D('Admin/Member');
    		if($model->create(I('post.'), 1))
    		{
    			if($model->add())
    			{
    				$this->success('注册成功！', U('login'));
    				exit;
    			}
    		}
    		$this->error($model->getError());
    	}
    	// 设置页面信息
    	$this->assign(array(
    		'_page_title' => '注册',
    		'_page_keywords' => '注册',
    		'_page_description' => '注册',
    	));
    	$this->display();
    }
    
	public function logout()
    {
    	$model = D('Admin/Member');
    	$model->logout();
    	redirect('/');
    }
  
}





