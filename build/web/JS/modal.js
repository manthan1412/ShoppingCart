/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


jQuery(document).ready(function($){
	var $form_modal = $('.cd-user-modal'),
                $container = $('.cd-user-modal-container'),
		$form_login = $form_modal.find('#cd-login'),
		$form_signup = $form_modal.find('#cd-signup'),
                $form_next = $form_modal.find('#cd-next'),
		$form_forgot_password = $form_modal.find('#cd-reset-password'),
		$form_modal_tab = $('.cd-switcher'),
		$tab_login = $form_modal_tab.children('li').eq(0).children('a'),
		$tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
		$forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
		$back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
                $back = $form_next.find('.cd-form-bottom-message a'),
		$main_nav = $('.cd-nav');

	//open modal
	$main_nav.on('click', function(event){

		if( $(event.target).is($main_nav) ) {
			// on mobile open the submenu
			$(this).children('ul').toggleClass('is-visible');
		} else {
			// on mobile close submenu
			$main_nav.children('ul').removeClass('is-visible');
			//show modal layer
//			$form_modal.addClass('is-visible');	
			//show the selected form
			if( $(event.target).is('.cd-signup') ) 
                            signup_selected();
                        else if($(event.target).is('.cd-signin'))
                            login_selected();
                        else if($(event.target).is('.cd-nexts'))
                            next_selected();
		}

	});

	//close modal
	$('.cd-user-modal').on('click', function(event){
		if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) {
			$form_modal.removeClass('is-visible');
                        $container.removeClass('is-visible');
		}	
	});
	//close modal when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which==='27'){
    		$form_modal.removeClass('is-visible');
                $container.removeClass('is-visible');
	    }
    });

	//switch from a tab to another
	$form_modal_tab.on('click', function(event) {
		event.preventDefault();
		( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected();
	});

	//hide or show password
	$('.hide-password').on('click', function(){
		var $this= $(this),
			$password_field = $this.prev('input');
		
		( 'password' == $password_field.attr('type') ) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
		( 'Hide' == $this.text() ) ? $this.text('Show') : $this.text('Hide');
		//focus and move cursor to the end of input field
		$password_field.putCursorAtEnd();
	});

	//show forgot-password form 
	$forgot_password_link.on('click', function(event){
		event.preventDefault();
		forgot_password_selected();
	});

	//back to login from the forgot-password form
	$back_to_login_link.on('click', function(event){
		event.preventDefault();
		login_selected();
	});

        $back.on('click',function (event){
           event.preventDefault();
           signup_selected();
        });
        
        
	function login_selected(){
                $form_modal.addClass('is-visible');
                $container.addClass('is-visible');
                $form_modal_tab.addClass('is-visible');
		$form_login.addClass('is-selected');
		$form_signup.removeClass('is-selected');
                $form_next.removeClass('is-selected');
		$form_forgot_password.removeClass('is-selected');
		$tab_login.addClass('selected');
		$tab_signup.removeClass('selected');
	}

	function signup_selected(){
                $form_modal.addClass('is-visible');
                $container.addClass('is-visible');
		$form_modal_tab.addClass('is-visible');
                $form_login.removeClass('is-selected');
                $form_next.removeClass('is-selected');
		$form_signup.addClass('is-selected');
                $form_forgot_password.removeClass('is-selected');
		$tab_login.removeClass('selected');
		$tab_signup.addClass('selected');
	}


        function next_selected(){
                $form_modal.addClass('is-visible');
                $container.addClass('is-visible');
                $form_modal_tab.addClass('is-visible');
                $form_next.addClass('is-selected');
                $form_login.removeClass('is-selected');
                $form_signup.removeClass('is-selected');
                $tab_login.removeClass('selected');
                $tab_signup.addClass('selected');
        }
        
	function forgot_password_selected(){
		$form_login.removeClass('is-selected');
		$form_signup.removeClass('is-selected');
		$form_forgot_password.addClass('is-selected');
	}
//        $form_login.find('input[type="submit"]').on('click', function(event){
//		event.preventDefault();
//		$form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
//	});
//	$form_signup.find('input[type="submit"]').on('click', function(event){
//		event.preventDefault();
//		$form_signup.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
//	});
});


//credits http://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function() {
	return this.each(function() {
    	// If this function exists...
    	if (this.setSelectionRange) {
      		// ... then use it (Doesn't work in IE)
      		// Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
      		var len = $(this).val().length * 2;
      		this.setSelectionRange(len, len);
    	} else {
    		// ... otherwise replace the contents with itself
    		// (Doesn't work in Google Chrome)
      		$(this).val($(this).val());
    	}
	});
};