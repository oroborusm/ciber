{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if isset($products) && $products}
	{*define number of products per line in other page for desktop*}
	{if $page_name !='index' && $page_name !='product'}
		{assign var='nbItemsPerLine' value=3}
		{assign var='nbItemsPerLineTablet' value=2}
		{assign var='nbItemsPerLineMobile' value=3}
	{else}
		{assign var='nbItemsPerLine' value=4}
		{assign var='nbItemsPerLineTablet' value=3}
		{assign var='nbItemsPerLineMobile' value=2}
	{/if}
	{*define numbers of product per line in other page for tablet*}
	{assign var='nbLi' value=$products|@count}
	{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
	{math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
	<!-- Products list -->
	<ul{if isset($id) && $id} id="{$id}"{/if} class="product_list grid row{if isset($class) && $class} {$class}{/if}">
	{foreach from=$products item=product name=products}
		{math equation="(total%perLine)" total=$smarty.foreach.products.total perLine=$nbItemsPerLine assign=totModulo}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
		{math equation="(total%perLineT)" total=$smarty.foreach.products.total perLineT=$nbItemsPerLineMobile assign=totModuloMobile}
		{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
		{if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
		{if $totModuloMobile == 0}{assign var='totModuloMobile' value=$nbItemsPerLineMobile}{/if}
		<li class="ajax_block_product{if $page_name == 'index' || $page_name == 'product'} col-lg-list col-xs-12 col-sm-3 col-md-3{else} col-xs-12 col-sm-6 col-md-4{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLine == 0} last-in-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLine == 1} first-in-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModulo)} last-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 0} last-item-of-tablet-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineTablet == 1} first-item-of-tablet-line{/if}{if $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 0} last-item-of-mobile-line{elseif $smarty.foreach.products.iteration%$nbItemsPerLineMobile == 1} first-item-of-mobile-line{/if}{if $smarty.foreach.products.iteration > ($smarty.foreach.products.total - $totModuloMobile)} last-mobile-line{/if}">
			<div class="product-container" itemscope itemtype="https://schema.org/Product">
				<div class="left-block">
					{if $product.specific_prices.reduction_type == 'percentage'}
						<div class="discount__box">
							<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
						</div>
					{/if}
					<div class="product-image-container">
						<a class="product_img_link" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url">
							<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} itemprop="image" />
						</a>
						<!-- {if isset($quick_view) && $quick_view}
							<div class="quick-view-wrapper-mobile">
								<a class="quick-view-mobile" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
									<i class="icon-eye-open"></i>
								</a>
							</div>
							<a class="quick-view" href="{$product.link|escape:'html':'UTF-8'}" rel="{$product.link|escape:'html':'UTF-8'}">
								<span>{l s='Quick view'}</span>
							</a>
						{/if} -->
						<!-- {if (!$PS_CATALOG_MODE && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
							<div class="content_pricee" itemprop="offers" itemscope itemtype="https://schema.org/Offer">
								{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
									<span itemprop="price" class="price product-price">
										{hook h="displayProductPriceBlock" product=$product type="before_price"}
										{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
									</span>
									<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
									{if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span class="old-price product-price">
											{displayWtPrice p=$product.price_without_reduction}
										</span>
										{if $product.specific_prices.reduction_type == 'percentage'}
											<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
										{/if}
									{/if}
									{if $PS_STOCK_MANAGEMENT && isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
										<span class="unvisible">
											{if ($product.allow_oosp || $product.quantity > 0)}
													<link itemprop="availability" href="https://schema.org/InStock" />{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
											{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
													<link itemprop="availability" href="https://schema.org/LimitedAvailability" />{l s='Product available with different options'}

											{else}
													<link itemprop="availability" href="https://schema.org/OutOfStock" />{l s='Out of stock'}
											{/if}
										</span>
									{/if}
									{hook h="displayProductPriceBlock" product=$product type="price"}
									{hook h="displayProductPriceBlock" product=$product type="unit_price"}
								{/if}
							</div>
						{/if} -->
						<!-- {if isset($product.new) && $product.new == 1}
							<a class="new-box" href="{$product.link|escape:'html':'UTF-8'}">
								<span class="new-label">{l s='New'}</span>
							</a>
						{/if} -->
						{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
							<a class="sale-box" href="{$product.link|escape:'html':'UTF-8'}">
								<span class="sale-label">{l s='Sale!'}</span>
							</a>
						{/if}
					</div>
					{if isset($product.is_virtual) && !$product.is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
					{hook h="displayProductPriceBlock" product=$product type="weight"}
				</div>
				<div class="right-block">
					<div class="price__box">
						<h5 itemprop="name">
							{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
							<a class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}" itemprop="url" >
								{$product.name|truncate:45:'...'|escape:'html':'UTF-8'}
							</a>
						</h5>
						<div class="content__nod_prolist">
							{capture name='displayProductListReviews'}{hook h='displayProductListReviews' product=$product}{/capture}
							{if $smarty.capture.displayProductListReviews}
								<div class="hook-reviews">
								{hook h='displayProductListReviews' product=$product}
								</div>
							{/if}
							<p class="product-desc font__zero" itemprop="description">
								{$product.description_short|strip_tags:'UTF-8'|truncate:360:'...'}
							</p>
							{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
								<div class="content_price">
									{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
										{hook h="displayProductPriceBlock" product=$product type='before_price'}
										<span class="price product-price">
											{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
										</span>
										{if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
											{hook h="displayProductPriceBlock" product=$product type="old_price"}
											<span class="old-price ">
												Antes a <span class="inline__block">{displayWtPrice p=$product.price_without_reduction}</span>
											</span>
											{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
											{if $product.specific_prices.reduction_type == 'percentage'}
												<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
											{/if}
										{/if}
										{hook h="displayProductPriceBlock" product=$product type="price"}
										{hook h="displayProductPriceBlock" product=$product type="unit_price"}
										{hook h="displayProductPriceBlock" product=$product type='after_price'}
									{/if}
								</div>
							{/if}
							<div class="button-containerr">
								{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
									{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}
										{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
										<a class="ajax_add_to_cart_button carrito__list" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
											<!-- <span>{l s='Add to cart'}</span> -->
											<svg id="FRONT" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 35.59 37.01">
												<g>
													<path d="M1342.45,157.09h-2.53l-7.58,0c-0.68,0-.72,0-0.74.73,0,1.29-.06,2.58-0.08,3.87a5.85,5.85,0,0,0,0,.67,0.38,0.38,0,0,0,.43.4h0.45l12,0,6.68,0c0.26,0,.34.06,0.34,0.32s0,0.73-.06,1.1a0.26,0.26,0,0,1-.27.24l-0.63,0-14.93-.07-5.32,0c-0.37,0-.43-0.06-0.45-0.43,0-.17,0-0.34,0-0.51,0-1.58,0-3.16.08-4.73a10.75,10.75,0,0,0-.39-3.68c-1.43-4.54-2.81-9.08-4.22-13.63-0.36-1.16-.74-2.32-1.1-3.48a1.42,1.42,0,0,0-.54-0.72l-1.91-1.45-0.38-.31a0.26,0.26,0,0,1,0-.4c0.17-.22.33-0.44,0.51-0.65s0.34-.33.67-0.08c0.92,0.67,1.83,1.36,2.76,2a1.23,1.23,0,0,1,.48.69c0.46,1.55.94,3.1,1.41,4.64,0.07,0.22.16,0.43,0.24,0.64a0.48,0.48,0,0,0,.5.37l0.35,0c3.83,0.21,7.66.41,11.5,0.64q4.1,0.24,8.2.53c2.44,0.17,4.87.37,7.31,0.55q0.66,0.05,1.31.14a0.28,0.28,0,0,1,.29.38,3.35,3.35,0,0,1-.09.48q-0.5,2-1,4-0.91,3.58-1.81,7.16a0.48,0.48,0,0,1-.48.41c-0.39,0-.78.06-1.18,0.06h-9.77Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
													<path d="M1329.6,168.08a3.11,3.11,0,0,0,3.16,3.14,3,3,0,0,0,2.88-3.14,3.12,3.12,0,0,0-3.14-3A3,3,0,0,0,1329.6,168.08Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
													<path d="M1351.54,168a3.13,3.13,0,0,0-2.54-3.11,2.86,2.86,0,0,0-2.93,1.4,2.68,2.68,0,0,0,.17,3.48A2.93,2.93,0,0,0,1351.54,168Z" transform="translate(-1321.19 -134.2)" style="fill: #ff7300"/>
												</g>
											</svg>
										</a>
									{else}
										<span class="button ajax_add_to_cart_button btn btn-default disabled">
											<span>{l s='Add to cart'}</span>
										</span>
									{/if}
								{/if}
								<!-- <a class="button lnk_view btn btn-default" href="{$product.link|escape:'html':'UTF-8'}" title="{l s='View'}">
									<span>{if (isset($product.customization_required) && $product.customization_required)}{l s='Customize'}{else}{l s='More'}{/if}</span>
								</a> -->
							</div>
							{if isset($product.color_list)}
								<div class="color-list-container">{$product.color_list}</div>
							{/if}
							<div class="product-flags">
								{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
									{if isset($product.online_only) && $product.online_only}
										<span class="online_only">{l s='Online only'}</span>
									{/if}
								{/if}
								{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
									{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}
										<span class="discount">{l s='Reduced price!'}</span>
									{/if}
							</div>
							{if (!$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
								{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}
									<span class="availability">
										{if ($product.allow_oosp || $product.quantity > 0)}
											<span class="{if $product.quantity <= 0 && isset($product.allow_oosp) && !$product.allow_oosp} label-danger{elseif $product.quantity <= 0} label-warning{else} label-success{/if}">
												{if $product.quantity <= 0}{if $product.allow_oosp}{if isset($product.available_later) && $product.available_later}{$product.available_later}{else}{l s='In Stock'}{/if}{else}{l s='Out of stock'}{/if}{else}{if isset($product.available_now) && $product.available_now}{$product.available_now}{else}{l s='In Stock'}{/if}{/if}
											</span>
										{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}
											<span class="label-warning">
												{l s='Product available with different options'}
											</span>
										{else}
											<span class="label-danger">
												{l s='Out of stock'}
											</span>
										{/if}
									</span>
								{/if}
							{/if}
						</div>

					</div>





				</div>  <!--  right-block  -->
				{if $page_name != 'index'}
					<div class="functional-buttons clearfix">
						{hook h='displayProductListFunctionalButtons' product=$product}
						{if isset($comparator_max_item) && $comparator_max_item}
							<div class="compare">
								<a class="add_to_compare" href="{$product.link|escape:'html':'UTF-8'}" data-id-product="{$product.id_product}">{l s='Add to Compare'}</a>
							</div>
						{/if}
					</div>
				{/if}
			</div><!-- .product-container> -->
		</li>
	{/foreach}
	</ul>
{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{/if}
