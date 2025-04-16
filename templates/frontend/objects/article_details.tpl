{**
 * templates/frontend/objects/article_details.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article which displays all details about the article.
 *  Expected to be primary object on the page.
 *
 * Many journals will want to add custom data to this object, either through
 * plugins which attach to hooks on the page or by editing the template
 * themselves. In order to facilitate this, a flexible layout markup pattern has
 * been implemented. If followed, plugins and other content can provide markup
 * in a way that will render consistently with other items on the page. This
 * pattern is used in the .main_entry column and the .entry_details column. It
 * consists of the following:
 *
 * <!-- Wrapper class which provides proper spacing between components -->
 * <div class="item">
 *     <!-- Title/value combination -->
 *     <div class="label">Abstract</div>
 *     <div class="value">Value</div>
 * </div>
 *
 * All styling should be applied by class name, so that titles may use heading
 * elements (eg, <h3>) or any element required.
 *
 * <!-- Example: component with multiple title/value combinations -->
 * <div class="item">
 *     <div class="sub_item">
 *         <div class="label">DOI</div>
 *         <div class="value">12345678</div>
 *     </div>
 *     <div class="sub_item">
 *         <div class="label">Published Date</div>
 *         <div class="value">2015-01-01</div>
 *     </div>
 * </div>
 *
 * <!-- Example: component with no title -->
 * <div class="item">
 *     <div class="value">Whatever you'd like</div>
 * </div>
 *
 * Core components are produced manually below, but can also be added via
 * plugins using the hooks provided:
 *
 * Templates::Article::Main
 * Templates::Article::Details
 *
 * @uses $article Submission This article
 * @uses $publication Publication The publication being displayed
 * @uses $firstPublication Publication The first published version of this article
 * @uses $currentPublication Publication The most recently published version of this article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $categories Category The category this article is assigned to
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 * @uses $keywords array List of keywords assigned to this article
 * @uses $pubIdPlugins Array of pubId plugins which this article may be assigned
 * @uses $licenseTerms string License terms.
 * @uses $licenseUrl string URL to license. Only assigned if license should be
 *   included with published submissions.
 * @uses $ccLicenseBadge string An image and text with details about the license
 *}
{if !$heading}
	{assign var="heading" value="h3"}
{/if}
<article class="obj_article_details container mx-auto bg-white border border-gray-200 md:border-l-4 md:border-l-primary-light rounded-md md:rounded-md p-2 sm:p-4 md:p-8 my-8 md:my-12">

	{* Indicate if this is only a preview *}
	{if $publication->getData('status') !== \PKP\submission\PKPSubmission::STATUS_PUBLISHED}
	<div class="cmp_notification notice">
		{capture assign="submissionUrl"}{url page="workflow" op="access" path=$article->getId()}{/capture}
		{translate key="submission.viewingPreview" url=$submissionUrl}
	</div>
	{elseif $currentPublication->getId() !== $publication->getId()}
		<div class="cmp_notification notice">
			{capture assign="latestVersionUrl"}{url page="article" op="view" path=$article->getBestId()}{/capture}
			{translate key="submission.outdatedVersion"
				datePublished=$publication->getData('datePublished')|date_format:$dateFormatShort
				urlRecentVersion=$latestVersionUrl|escape
			}
		</div>
	{/if}

	<div class="grid grid-cols-1 md:grid-cols-3 gap-4 md:gap-8 mt-6 md:mt-8">
		<div class="md:col-span-2">

			{* DOI *}
			{foreach from=$pubIdPlugins item=pubIdPlugin}
				{if $pubIdPlugin->getPubIdType() != 'doi'}
					{continue}
				{/if}
				{assign var=pubId value=$publication->getData('pub-id::doi')}
				{if $pubId}
					{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					<section class="item doi mb-6">
						<h2 class="label">
							{capture assign=translatedDOI}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
							{translate key="semicolon" label=$translatedDOI}
						</h2>
						<span class="value">
							<a href="{$doiUrl}">
								{$doiUrl}
							</a>
						</span>
					</section>
				{/if}
			{/foreach}

			{* Keywords *}
			{if !empty($publication->getLocalizedData('keywords'))}
			<section class="item keywords mb-6">
				<h2 class="label">
					{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
					{translate key="semicolon" label=$translatedKeywords}
				</h2>
				<span class="value">
					{foreach name="keywords" from=$publication->getLocalizedData('keywords') item="keyword"}
						{$keyword|escape}{if !$smarty.foreach.keywords.last}{translate key="common.commaListSeparator"}{/if}
					{/foreach}
				</span>
			</section>
			{/if}

			{* Abstract *}
			{if $publication->getLocalizedData('abstract')}
				<section class="item abstract mb-6 prose prose-md sm:prose-xl max-w-full font-serif">
					<h2 class="label">{translate key="article.abstract"}</h2>
					{$publication->getLocalizedData('abstract')|strip_unsafe_html}
				</section>
			{/if}

			{call_hook name="Templates::Article::Main"}

			{* Author biographies *}
			{assign var="hasBiographies" value=0}
			{foreach from=$publication->getData('authors') item=author}
				{if $author->getLocalizedBiography()}
					{assign var="hasBiographies" value=$hasBiographies+1}
				{/if}
			{/foreach}
			{if $hasBiographies}
				<section class="item author_bios mb-6">
					<h2 class="label">
						{if $hasBiographies > 1}
							{translate key="submission.authorBiographies"}
						{else}
							{translate key="submission.authorBiography"}
						{/if}
					</h2>
					<ul class="authors space-y-2">
					{foreach from=$publication->getData('authors') item=author}
						{if $author->getLocalizedBiography()}
							<li class="sub_item mb-2">
								<div class="label">
									{if $author->getLocalizedAffiliation()}
										{capture assign="authorName"}{$author->getFullName()|escape}{/capture}
										{capture assign="authorAffiliation"} {$author->getLocalizedAffiliation()|escape} {/capture}
										{translate key="submission.authorWithAffiliation" name=$authorName affiliation=$authorAffiliation}
									{else}
										{$author->getFullName()|escape}
									{/if}
								</div>
								<div class="value">
									{$author->getLocalizedBiography()|strip_unsafe_html}
								</div>
							</li>
						{/if}
					{/foreach}
					</ul>
				</section>
			{/if}

			{* References *}
			{if $parsedCitations || $publication->getData('citationsRaw')}
				<section class="item references mb-6">
					<h2 class="label">
						{translate key="submission.citations"}
					</h2>
					<div class="value">
						{if $parsedCitations}
							{foreach from=$parsedCitations item="parsedCitation"}
								<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
							{/foreach}
						{else}
							{$publication->getData('citationsRaw')|escape|nl2br}
						{/if}
					</div>
				</section>
			{/if}

		</div><!-- .main_entry -->

		<div class="md:col-span-1 mt-8 md:mt-0">
			<aside class="space-y-6 bg-gray-50 border border-gray-100 md:rounded-md rounded-none md:p-4 p-2">
				{* Article/Issue cover image *}
				{if $publication->getLocalizedData('coverImage') || ($issue && $issue->getLocalizedCoverImage())}
					<div class="item cover_image mb-4">
						<div class="sub_item">
							{if $publication->getLocalizedData('coverImage')}
								{assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
								<img
									src="{$publication->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
									alt="{$coverImage.altText|escape|default:''}"
									class="rounded w-full object-cover border border-gray-200"
								>
							{else}
								<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
									<img src="{$issue->getLocalizedCoverImageUrl()|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}" class="rounded w-full object-cover border border-gray-200">
								</a>
							{/if}
						</div>
					</div>
				{/if}

				

				{* Article Galleys *}
				{if $primaryGalleys}
					<div class="item galleys mb-4">
						<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
							{translate key="submission.downloads"}
						</h2>
						<ul class="value galleys_links space-y-1">
							{foreach from=$primaryGalleys item=galley}
								<li>
									{include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}
				{if $supplementaryGalleys}
					<div class="item galleys mb-4">
						<h3 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
							{translate key="submission.additionalFiles"}
						</h3>
						<ul class="value supplementary_galleys_links space-y-1">
							{foreach from=$supplementaryGalleys item=galley}
								<li>
									{include file="frontend/objects/galley_link.tpl" parent=$article publication=$publication galley=$galley isSupplementary="1"}
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}

				{if $publication->getData('datePublished')}
					<div class="item published mb-4">
						<section class="sub_item mb-2">
							<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
								{translate key="submissions.published"}
							</h2>
							<div class="value text-sm text-gray-700">
								{if $firstPublication->getId() === $publication->getId()}
									<span>{$firstPublication->getData('datePublished')|date_format:$dateFormatShort}</span>
								{else}
									<span>{translate key="submission.updatedOn" datePublished=$firstPublication->getData('datePublished')|date_format:$dateFormatShort dateUpdated=$publication->getData('datePublished')|date_format:$dateFormatShort}</span>
								{/if}
							</div>
						</section>
						{if count($article->getPublishedPublications()) > 1}
							<section class="sub_item versions mb-2">
								<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
									{translate key="submission.versions"}
								</h2>
								<ul class="value text-sm">
									{foreach from=array_reverse($article->getPublishedPublications()) item=iPublication}
										{capture assign="name"}{translate key="submission.versionIdentity" datePublished=$iPublication->getData('datePublished')|date_format:$dateFormatShort version=$iPublication->getData('version')}{/capture}
										<li>
											{if $iPublication->getId() === $publication->getId()}
												{$name}
											{elseif $iPublication->getId() === $currentPublication->getId()}
												<a href="{url page="article" op="view" path=$article->getBestId()}">{$name}</a>
											{else}
												<a href="{url page="article" op="view" path=$article->getBestId()|to_array:"version":$iPublication->getId()}">{$name}</a>
											{/if}
										</li>
									{/foreach}
								</ul>
							</section>
						{/if}
					</div>
				{/if}

				{if $publication->getLocalizedData('dataAvailability')}
					<section class="item dataAvailability">
						<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="submission.dataAvailability"}</h2>
						<div class="text-sm text-gray-700">{$publication->getLocalizedData('dataAvailability')|strip_unsafe_html}</div>
					</section>
				{/if}

				{if $issue || $section || $categories || $doiObject}
					{* Issue, Section, Categories *}
					<div class="item issue mb-4">
					{* DOI *}
				{assign var=doiObject value=$article->getCurrentPublication()->getData('doiObject')}
				{if $doiObject}
				  {assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
				  <section class="item doi mb-4">
				    <h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
				      {capture assign=translatedDOI}{translate key="doi.readerDisplayName"}{/capture}
				      {translate key="semicolon" label=$translatedDOI}
				    </h2>
				    <span class="value text-sm text-primary">
				      <a href="{$doiUrl}">{$doiUrl}</a>
				    </span>
				  </section>
				{/if}
						{if $issue}
							<section class="sub_item mb-2">
								<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="issue.issue"}</h2>
								<div class="value text-sm text-primary">
									<a class="title" href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
										{$issue->getIssueIdentification()}
									</a>
								</div>
							</section>
						{/if}
						{if $section}
							<section class="sub_item mb-2">
								<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="section.section"}</h2>
								<div class="value text-sm text-gray-700">
									{$section->getLocalizedTitle()|escape}
								</div>
							</section>
						{/if}
						{if $categories}
							<section class="sub_item mb-2">
								<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="category.category"}</h2>
								<div class="value text-sm text-gray-700">
									<ul class="categories flex flex-wrap gap-2 mt-1">
										{foreach from=$categories item=category}
											<li><a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|escape}">{$category->getLocalizedTitle()|escape}</a></li>
										{/foreach}
									</ul>
								</div>
							</section>
						{/if}
					</div>
				{/if}

					{* PubIds (requires plugins) *}
					{foreach from=$pubIdPlugins item=pubIdPlugin}
					  {if $pubIdPlugin->getPubIdType() == 'doi'}
					    {continue}
					  {/if}
					  {assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					  {if $pubId}
					    <section class="item pubid mb-4">
					      <h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
					        {$pubIdPlugin->getPubIdDisplayType()|escape}
					      </h2>
					      <div class="value text-sm text-gray-700">
					        {if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					          <a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
					            {$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					          </a>
					        {else}
					          {$pubId|escape}
					        {/if}
					      </div>
					    </section>
					  {/if}
					{/foreach}

				{if $currentContext->getLocalizedData('licenseTerms') || $publication->getData('licenseUrl')}
					<div class="item copyright mb-4">
						<h2 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">
							{translate key="submission.license"}
						</h2>
						<div class="text-sm text-gray-700">
							{if $publication->getData('licenseUrl')}
								{if $ccLicenseBadge}
									{if $publication->getLocalizedData('copyrightHolder')}
										<p>{translate key="submission.copyrightStatement" copyrightHolder=$publication->getLocalizedData('copyrightHolder') copyrightYear=$publication->getData('copyrightYear')}</p>
									{/if}
									{$ccLicenseBadge}
								{else}
									<a href="{$publication->getData('licenseUrl')|escape}" class="copyright">
										{if $publication->getLocalizedData('copyrightHolder')}
											{translate key="submission.copyrightStatement" copyrightHolder=$publication->getLocalizedData('copyrightHolder') copyrightYear=$publication->getData('copyrightYear')}
										{else}
											{translate key="submission.license"}
										{/if}
									</a>
								{/if}
							{/if}
							{$currentContext->getLocalizedData('licenseTerms')}
						</div>
					</div>
				{/if}

				{call_hook name="Templates::Article::Details"}
			</aside>
		</div><!-- .entry_details -->
	</div><!-- .row -->

</article>
