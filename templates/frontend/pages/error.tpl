{**
 * templates/frontend/pages/error.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Generic error page.
 * Displays a simple error message and (optionally) a return link.
 *}
{include file="frontend/components/header.tpl"}

<section class="uk-section-primary uk-section uk-section-small" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">

	<div class="uk-container">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}

		<h1 class="uk-h2 uk-margin-remove-top" uk-scrollspy-class>
			{translate key=$errorMsg params=$errorParams}
		</h1>
	</div>

</section>

<div class="page page_error">
	{if $backLink}
		<div class="cmp_back_link">
			<a href="{$backLink}">{translate key=$backLinkLabel}</a>
		</div>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
