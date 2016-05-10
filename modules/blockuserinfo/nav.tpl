<!-- Block user information module NAV  -->
<div class="header_user_info">
	{if $is_logged}
		<div class="logged">
			<p class="cart__of">carro de:</p>
			<a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow">
				<span class="font__light">{$cookie->customer_firstname} {$cookie->customer_lastname}</span>
			</a>
			<a class="logout" href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log me out' mod='blockuserinfo'}">
				{l s='Sign out' mod='blockuserinfo'}
			</a>
		</div>
	{else}
		<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
			Ingresa con tu cuenta toolmania regular
		</a>
	{/if}
</div>
<!-- /Block usmodule NAV -->
