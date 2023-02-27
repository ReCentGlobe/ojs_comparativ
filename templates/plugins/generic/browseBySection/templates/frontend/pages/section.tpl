{**
 * plugins/generic/browseBySection/templates/frontend/pages/section.tpl
 *
 * Copyright (c) 2017 Simon Fraser University
 * Copyright (c) 2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the reader-facing section page.
 *
 * @uses $section Section
 * @uses $sectionPath string The URL path for this section
 * @uses $sectionDescription string
 * @uses $articles array List of Submission objects
 * @uses $issues array List of Issue objects the $articles are published in
 * @uses $currentlyShowingStart int 20 in `20-30 of 100 results`
 * @uses $currentlyShowingEnd int 30 in `20-30 of 100 results`
 * @uses $countMax int 100 in `20-30 of 100 results`
 * @uses $currentlyShowingPage int 2 in `2 of 10 pages`
 * @uses $countMaxPage int 10 in `2 of 10 pages`.
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$section->getLocalizedTitle()}

<section class="uk-section-primary uk-section uk-section-small">
	<div class="uk-container animated fadeIn">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.subscriptions"}
		<h1 class="uk-h2 uk-margin-remove-top">
			{$section->getLocalizedTitle()|escape} Archive
		</h1>
		<h2 class="uk-h4 uk-margin">
			{$sectionDescription}
		</h2>
	</div>
</section>

<section class="uk-section-default uk-section uk-section-medium page_section_{$sectionPath|escape}" uk-scrollspy="&#123;&quot;target&quot;:&quot;[uk-scrollspy-class]&quot;,&quot;cls&quot;:&quot;uk-animation-fade&quot;,&quot;delay&quot;:100&#125">
	<div class="uk-container">
		{if $articles|@count}
			<div class="uk-width-1-1">



				{foreach from=$articles item=article}

					<article class="uk-margin-medium uk-margin-remove-top uk-panel uk-article" uk-scrollspy-class>
						{* TODO remove section=null workaround. article_summary.tpl expects a specific section array. See issue_toc.tpl. *}
						{include file="frontend/objects/article_summary_wissue.tpl" section=null showDatePublished=true hideGalleys=true allIssues=$issues}
						<hr>
					</article>
				{/foreach}

				{* Pagination *}
				{* Pagination *}
				{if $prevPage > 1}
					{capture assign="prevUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$prevPage}{/capture}
				{elseif $prevPage === 1}
					{capture assign="prevUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath}{/capture}
				{/if}
				{if $nextPage}
					{capture assign="nextUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$nextPage}{/capture}
				{/if}
				{include
				file="frontend/components/pagination.tpl"
				prevUrl=$prevUrl
				nextUrl=$nextUrl
				showingStart=$showingStart
				showingEnd=$showingEnd
				total=$total
				}
			</div>
		{else}
			<p class="section_empty">
				{translate key="plugins.generic.browseBySection.emptySection"}
			</p>
		{/if}
	</div>

</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
