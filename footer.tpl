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
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if isset($right_column_size) && !empty($right_column_size)}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">{$HOOK_RIGHT_COLUMN}</div>
					{/if}
					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
		</div><!-- #page -->
		<footer>
			<figure class="oficial__nod">
				<img class="oficial__nod_img" src="{$img_dir}empresa-oficial.png" alt="empresa oficial ciberday 2016">
			</figure>
			{include file="$tpl_dir./content-footer.tpl"}
			<div class="contact__nod">
				<ul class="contact__nod__ul">
					<li>
						<p>Diagonal Oriente 1355 Ñuñoa - Santiago Chile</p>
					</li>
					<li>
						<p>Telefono : +56 2 2379 2187 de 9hrs a 18hrs</p>
					</li>
					<li>
						<img src="{$img_dir}pagos.png" alt="medios de pagos asociados" class="pagos">
					</li>
				</ul>
			</div>
		</footer>
{/if}
{include file="$tpl_dir./global.tpl"}
{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
	{$js_def}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
	{/foreach}
{/if}
<script src="{$js_dir}app.js"></script>

	</body>
</html>
