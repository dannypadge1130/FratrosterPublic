// Place your Spring DSL code here
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler

beans = {
	redirectSuccessHandler(SimpleUrlAuthenticationSuccessHandler) {
		defaultTargetUrl = '/profile'
	}
	
	redirectFailureHandler(SimpleUrlAuthenticationFailureHandler) {
		defaultFailureUrl = '/'
	}
}
