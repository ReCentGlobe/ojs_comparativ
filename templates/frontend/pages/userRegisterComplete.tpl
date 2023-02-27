{**
 * templates/frontend/pages/userRegisterComplete.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A landing page displayed to users upon successful registration
 *}
{include file="frontend/components/header.tpl"}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{* Display a message if no current issue exists *}
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			Registration complete
		</h1>

	</div>

</section>

<section class="uk-section-default uk-section uk-section-medium" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:200&#125">
	<div class="uk-container">
	<div uk-alert class="uk-alert-success">
		{translate key="user.login.registrationComplete.instructions"}
	</div>
		<div class="uk-margin uk-flex uk-flex-center" uk-grid>
			<div class="uk-width-1-2">
				<a class="uk-button uk-button-default" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="profile"}">
					{translate key="user.editMyProfile"}
				</a>
			</div>
			<div class="uk-width-1-2">
				<a class="uk-button uk-button-default" href="{url page="index"}">
					{translate key="user.login.registrationComplete.continueBrowsing"}
				</a>
			</div>
		</div>

	</div>
</section>

{include file="frontend/components/footer.tpl"}
