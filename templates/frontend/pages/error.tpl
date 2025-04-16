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

<section class="bg-primary py-8">
	<div class="container mx-auto">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
		<h1 class="text-2xl font-bold text-white mt-0 animate-fadeIn">
			{translate key=$errorMsg params=$errorParams}
		</h1>
	</div>
</section>

<div class="page page_error max-w-xl mx-auto my-8">
	{if $backLink}
		<div class="cmp_back_link mt-4">
			<a href="{$backLink}" class="text-primary hover:underline">{translate key=$backLinkLabel}</a>
		</div>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
