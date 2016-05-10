{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- MODULE Block cart -->
{if isset($blockcart_top) && $blockcart_top}
<div class="clearfix{if $PS_CATALOG_MODE} header_user_catalog{/if} right">
{/if}
	<div class="shopping_cart">
		<a href="{$link->getPageLink($order_process, true)|escape:'html':'UTF-8'}" title="{l s='View my shopping cart' mod='blockcart'}" rel="nofollow" class="cart__button">
			<svg id="FRONT" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35.59 37.01">
				<g>
					<path d="M1342.45,157.09h-2.53l-7.58,0c-0.68,0-.72,0-0.74.73,0,1.29-.06,2.58-0.08,3.87a5.85,5.85,0,0,0,0,.67,0.38,0.38,0,0,0,.43.4h0.45l12,0,6.68,0c0.26,0,.34.06,0.34,0.32s0,0.73-.06,1.1a0.26,0.26,0,0,1-.27.24l-0.63,0-14.93-.07-5.32,0c-0.37,0-.43-0.06-0.45-0.43,0-.17,0-0.34,0-0.51,0-1.58,0-3.16.08-4.73a10.75,10.75,0,0,0-.39-3.68c-1.43-4.54-2.81-9.08-4.22-13.63-0.36-1.16-.74-2.32-1.1-3.48a1.42,1.42,0,0,0-.54-0.72l-1.91-1.45-0.38-.31a0.26,0.26,0,0,1,0-.4c0.17-.22.33-0.44,0.51-0.65s0.34-.33.67-0.08c0.92,0.67,1.83,1.36,2.76,2a1.23,1.23,0,0,1,.48.69c0.46,1.55.94,3.1,1.41,4.64,0.07,0.22.16,0.43,0.24,0.64a0.48,0.48,0,0,0,.5.37l0.35,0c3.83,0.21,7.66.41,11.5,0.64q4.1,0.24,8.2.53c2.44,0.17,4.87.37,7.31,0.55q0.66,0.05,1.31.14a0.28,0.28,0,0,1,.29.38,3.35,3.35,0,0,1-.09.48q-0.5,2-1,4-0.91,3.58-1.81,7.16a0.48,0.48,0,0,1-.48.41c-0.39,0-.78.06-1.18,0.06h-9.77Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
					<path d="M1329.6,168.08a3.11,3.11,0,0,0,3.16,3.14,3,3,0,0,0,2.88-3.14,3.12,3.12,0,0,0-3.14-3A3,3,0,0,0,1329.6,168.08Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
					<path d="M1351.54,168a3.13,3.13,0,0,0-2.54-3.11,2.86,2.86,0,0,0-2.93,1.4,2.68,2.68,0,0,0,.17,3.48A2.93,2.93,0,0,0,1351.54,168Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
				</g>
			</svg>

			<b>{l s='Cart' mod='blockcart'}</b>
			<span class="ajax_cart_quantity{if $cart_qties == 0} unvisible{/if}">{$cart_qties}</span>
			<span class="ajax_cart_total{if $cart_qties == 0} unvisible{/if}">
				{if $cart_qties > 0}
					{if $priceDisplay == 1}
						{assign var='blockcart_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(false, $blockcart_cart_flag)}
					{else}
						{assign var='blockcart_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(true, $blockcart_cart_flag)}
					{/if}
				{/if}
			</span>
			<span class="ajax_cart_no_product{if $cart_qties > 0} unvisible{/if}">0</span>
			{if $ajax_allowed && isset($blockcart_top) && !$blockcart_top}
				<span class="block_cart_expand{if !isset($colapseExpandStatus) || (isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded')} unvisible{/if}">&nbsp;</span>
				<span class="block_cart_collapse{if isset($colapseExpandStatus) && $colapseExpandStatus eq 'collapsed'} unvisible{/if}">&nbsp;</span>
			{/if}
		</a>
		{if !$PS_CATALOG_MODE}
			<div class="cart_block block exclusive">
				<div class="block_content">
					<!-- block list of products -->
					<div class="cart_block_list{if isset($blockcart_top) && !$blockcart_top}{if isset($colapseExpandStatus) && $colapseExpandStatus eq 'expanded' || !$ajax_allowed || !isset($colapseExpandStatus)} expanded{else} collapsed unvisible{/if}{/if}">
						{if $products}
							<dl class="products">
								{foreach from=$products item='product' name='myLoop'}
									{assign var='productId' value=$product.id_product}
									{assign var='productAttributeId' value=$product.id_product_attribute}
									<dt data-id="cart_block_product_{$product.id_product|intval}_{if $product.id_product_attribute}{$product.id_product_attribute|intval}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery|intval}{else}0{/if}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
										<a class="cart-images" href="{$link->getProductLink($product.id_product, $product.link_rewrite, $product.category)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'cart_default')}" alt="{$product.name|escape:'html':'UTF-8'}" /></a>
										<div class="cart-info">
											<div class="product-name">
												<span class="quantity-formated"><span class="quantity">{$product.cart_quantity}</span>&nbsp;x&nbsp;</span><a class="cart_block_product_name" href="{$link->getProductLink($product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">{$product.name|truncate:13:'...'|escape:'html':'UTF-8'}</a>
											</div>
											{if isset($product.attributes_small)}
												<div class="product-atributes">
													<a href="{$link->getProductLink($product, $product.link_rewrite, $product.category, null, null, $product.id_shop, $product.id_product_attribute)|escape:'html':'UTF-8'}" title="{l s='Product detail' mod='blockcart'}">{$product.attributes_small}</a>
												</div>
											{/if}
											<span class="price">
												{if !isset($product.is_gift) || !$product.is_gift}
													{if $priceDisplay == $smarty.const.PS_TAX_EXC}{displayWtPrice p="`$product.total`"}{else}{displayWtPrice p="`$product.total_wt`"}{/if}
                                                    <div class="hookDisplayProductPriceBlock-price">
                                                        {hook h="displayProductPriceBlock" product=$product type="price" from="blockcart"}
                                                    </div>
												{else}
													{l s='Free!' mod='blockcart'}
												{/if}
											</span>
										</div>
										<span class="remove_link">
											{if !isset($customizedDatas.$productId.$productAttributeId) && (!isset($product.is_gift) || !$product.is_gift)}
												<a class="ajax_cart_block_remove_link" href="{$link->getPageLink('cart', true, NULL, "delete=1&id_product={$product.id_product|intval}&ipa={$product.id_product_attribute|intval}&id_address_delivery={$product.id_address_delivery|intval}&token={$static_token}")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='remove this product from my cart' mod='blockcart'}">&nbsp;</a>
											{/if}
										</span>
									</dt>
									{if isset($product.attributes_small)}
										<dd data-id="cart_block_combination_of_{$product.id_product|intval}{if $product.id_product_attribute}_{$product.id_product_attribute|intval}{/if}_{$product.id_address_delivery|intval}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
									{/if}
									<!-- Customizable datas -->
									{if isset($customizedDatas.$productId.$productAttributeId[$product.id_address_delivery])}
										{if !isset($product.attributes_small)}
											<dd data-id="cart_block_combination_of_{$product.id_product|intval}_{if $product.id_product_attribute}{$product.id_product_attribute|intval}{else}0{/if}_{if $product.id_address_delivery}{$product.id_address_delivery|intval}{else}0{/if}" class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}">
										{/if}
										<ul class="cart_block_customizations" data-id="customization_{$productId}_{$productAttributeId}">
											{foreach from=$customizedDatas.$productId.$productAttributeId[$product.id_address_delivery] key='id_customization' item='customization' name='customizations'}
												<li name="customization">
													<div data-id="deleteCustomizableProduct_{$id_customization|intval}_{$product.id_product|intval}_{$product.id_product_attribute|intval}_{$product.id_address_delivery|intval}" class="deleteCustomizableProduct">
														<a class="ajax_cart_block_remove_link" href="{$link->getPageLink('cart', true, NULL, "delete=1&id_product={$product.id_product|intval}&ipa={$product.id_product_attribute|intval}&id_customization={$id_customization|intval}&token={$static_token}")|escape:'html':'UTF-8'}" rel="nofollow">&nbsp;</a>
													</div>
													{if isset($customization.datas.$CUSTOMIZE_TEXTFIELD.0)}
														{$customization.datas.$CUSTOMIZE_TEXTFIELD.0.value|replace:"<br />":" "|truncate:28:'...'|escape:'html':'UTF-8'}
													{else}
														{l s='Customization #%d:' sprintf=$id_customization|intval mod='blockcart'}
													{/if}
												</li>
											{/foreach}
										</ul>
										{if !isset($product.attributes_small)}</dd>{/if}
									{/if}
									{if isset($product.attributes_small)}</dd>{/if}
								{/foreach}
							</dl>
						{/if}
						<p class="cart_block_no_products{if $products} unvisible{/if}">
							{l s='No products' mod='blockcart'}
						</p>
						{if $discounts|@count > 0}
							<table class="vouchers{if $discounts|@count == 0} unvisible{/if}">
								{foreach from=$discounts item=discount}
									{if $discount.value_real > 0}
										<tr class="bloc_cart_voucher" data-id="bloc_cart_voucher_{$discount.id_discount|intval}">
											<td class="quantity">1x</td>
											<td class="name" title="{$discount.description}">
												{$discount.name|truncate:18:'...'|escape:'html':'UTF-8'}
											</td>
											<td class="price">
												-{if $priceDisplay == 1}{convertPrice price=$discount.value_tax_exc}{else}{convertPrice price=$discount.value_real}{/if}
											</td>
											<td class="delete">
												{if strlen($discount.code)}
													<a class="delete_voucher" href="{$link->getPageLink("$order_process", true)}?deleteDiscount={$discount.id_discount|intval}" title="{l s='Delete' mod='blockcart'}" rel="nofollow">
														<i class="icon-remove-sign"></i>
													</a>
												{/if}
											</td>
										</tr>
									{/if}
								{/foreach}
							</table>
						{/if}
						{assign var='free_ship' value=count($cart->getDeliveryAddressesWithoutCarriers(true, $errors))}
						<div class="cart-prices">
							<div class="cart-prices-line first-line">
								<span class="price cart_block_shipping_cost ajax_cart_shipping_cost{if !($page_name == 'order-opc') && $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery || $free_ship)} unvisible{/if}">
									{if $shipping_cost_float == 0}
										 {if !($page_name == 'order-opc') && (!isset($cart->id_address_delivery) || !$cart->id_address_delivery)}{l s='To be determined' mod='blockcart'}{else}{l s='Free shipping!' mod='blockcart'}{/if}
									{else}
										{$shipping_cost}
									{/if}
								</span>
								<span{if !($page_name == 'order-opc') && $shipping_cost_float == 0 && (!$cart_qties || $cart->isVirtualCart() || !isset($cart->id_address_delivery) || !$cart->id_address_delivery || $free_ship)} class="unvisible"{/if}>
									{l s='Shipping' mod='blockcart'}
								</span>
							</div>
							{if $show_wrapping}
								<div class="cart-prices-line">
									{assign var='cart_flag' value='Cart::ONLY_WRAPPING'|constant}
									<span class="price cart_block_wrapping_cost">
										{if $priceDisplay == 1}
											{convertPrice price=$cart->getOrderTotal(false, $cart_flag)}{else}{convertPrice price=$cart->getOrderTotal(true, $cart_flag)}
										{/if}
									</span>
									<span>
										{l s='Wrapping' mod='blockcart'}
									</span>
							   </div>
							{/if}
							{if $show_tax && isset($tax_cost)}
								<div class="cart-prices-line">
									<span class="price cart_block_tax_cost ajax_cart_tax_cost">{$tax_cost}</span>
									<span>{l s='Tax' mod='blockcart'}</span>
								</div>
							{/if}
							<div class="cart-prices-line last-line">
								<span class="price cart_block_total ajax_block_cart_total">{$total}</span>
								<span>{l s='Total' mod='blockcart'}</span>
							</div>
							{if $use_taxes && $display_tax_label && $show_tax}
								<p>
								{if $priceDisplay == 0}
									{l s='Prices are tax included' mod='blockcart'}
								{elseif $priceDisplay == 1}
									{l s='Prices are tax excluded' mod='blockcart'}
								{/if}
								</p>
							{/if}
						</div>
						<p class="cart-buttons">
							<a id="button_order_cart" class="btn btn-default button button-small" href="{$link->getPageLink("$order_process", true)|escape:"html":"UTF-8"}" title="{l s='Check out' mod='blockcart'}" rel="nofollow">
								<span>
									{l s='Check out' mod='blockcart'}<i class="icon-chevron-right right"></i>
								</span>
							</a>
						</p>
					</div>
				</div>
			</div><!-- .cart_block -->
		{/if}
	</div>
{if isset($blockcart_top) && $blockcart_top}
</div>
{/if}

{strip}
{addJsDef CUSTOMIZE_TEXTFIELD=$CUSTOMIZE_TEXTFIELD}
{addJsDef img_dir=$img_dir|escape:'quotes':'UTF-8'}
{addJsDef generated_date=$smarty.now|intval}
{addJsDef ajax_allowed=$ajax_allowed|boolval}
{addJsDef hasDeliveryAddress=(isset($cart->id_address_delivery) && $cart->id_address_delivery)}

{addJsDefL name=customizationIdMessage}{l s='Customization #' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=removingLinkText}{l s='remove this product from my cart' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=freeShippingTranslation}{l s='Free shipping!' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=freeProductTranslation}{l s='Free!' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=delete_txt}{l s='Delete' mod='blockcart' js=1}{/addJsDefL}
{addJsDefL name=toBeDetermined}{l s='To be determined' mod='blockcart' js=1}{/addJsDefL}
{/strip}
<!-- /MODULE Block cart -->
