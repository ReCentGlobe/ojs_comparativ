{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedArticles array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
<div class="obj_issue_toc bg-white border border-gray-200 md:border-l-4 md:border-l-primary-light rounded-md md:rounded-md rounded p-4 md:p-8 my-12">
    {foreach from=$userInstitutionalSubscriptions item=userInstitutionalSubscription}
    {$userInstitutionalSubscription->getInstitutionName()|escape}
    {/foreach}

    {* Indicate if this is only a preview *}
    {if !$issue->getPublished()}
        <div class="notification mb-4">
            {include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
        </div>
    {/if}

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="md:col-span-2">
            <div class="issue description mb-8">
                {* Description *}
                {if $issue->hasDescription()}
                    <div class="description text-gray-700 prose prose-md sm:prose-xl max-w-full font-serif prose-a:text-accent prose-a:underline hover:prose-a:text-accent-dark">
                        {$issue->getLocalizedDescription()|strip_unsafe_html}
                    </div>
                {/if}
            </div>
            {* Articles *}
            <div class="sections space-y-10">
                {foreach name=sections from=$publishedSubmissions item=section}
                    <div class="toc_section">
                        {if $section.articles}
                            {if $section.title}
                                <h4 class="text-2xl font-sans font-light text-gray-900 border-b-2 border-gray-200 pb-2 mb-4 tracking-tight">
                                    {$section.title|escape}
                                </h4>
                            {/if}
                            <div class="grid gap-6">
                                {foreach from=$section.articles item=article}
                                    <article>
                                        {include file="frontend/objects/article_summary.tpl"}
                                    </article>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                {/foreach}
            </div><!-- .sections -->
        </div>
        <div class="md:col-span-1 mt-8 md:mt-0">
            <aside class="space-y-6 bg-gray-50 border border-gray-100 md:rounded-md rounded-none md:p-4 p-2">
                <div class="issue cover_image mb-4">
                    {* Issue cover image *}
                    {assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
                    {if $issueCover}
                        <a href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
                            <img class="rounded w-full object-cover border border-gray-200 max-h-48 md:max-h-full" src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
                        </a>
                    {/if}
                </div>
                <div class="issue galley mb-4">
                    {* Full-issue galleys *}
                    {if $issueGalleys}
                        <h4 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="submission.downloads"}</h4>
                        <ul class="value galleys_links space-y-1">
                            {foreach from=$issueGalleys item=galley}
                                <li>
                                    {include file="frontend/objects/galley_link.tpl" parent=$issue purchaseFee=$currentJournal->getSetting('purchaseIssueFee') purchaseCurrency=$currentJournal->getSetting('currency')}
                                </li>
                            {/foreach}
                        </ul>
                    {/if}
                </div>
                <div class="issue published-date mb-4">
                    {* Published date *}
                    {if $issue->getDatePublished()}
                        <div class="published">
                            <h4 class="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2">{translate key="submissions.published"}</h4>
                            <span class="value text-sm text-gray-700 font-serif">
                                {$issue->getDatePublished()|date_format:"Y"}
                            </span>
                        </div>
                    {/if}
                </div>
                {if $pubId || $doiURL}
                    <div class="issue doi mb-2">
                        {* Pub IDs (eg - DOI, URN, etc.) *}
                        {foreach from=$pubIdPlugins item=pubIdPlugin}
                            {assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
                            {if $pubId}
                                {assign var="resolvingUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
                                <div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
                                    <span class="type text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2 block">
                                        {$pubIdPlugin->getPubIdDisplayType()|escape}:
                                    </span>
                                    <span class="id text-sm text-blue-600 font-serif break-all">
                                        {if $resolvingUrl}
                                            <a href="{$resolvingUrl}" class="underline hover:text-blue-800">{$resolvingUrl}</a>
                                        {else}
                                            {$pubId}
                                        {/if}
                                    </span>
                                </div>
                            {/if}
                        {/foreach}
                        {* DOI (from doiObject, if available) *}
                        {assign var=doiObject value=$issue->getData('doiObject')}
                        {if $doiObject}
                            {assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
                            <div class="pub_id doi">
                                <span class="type text-xs font-semibold uppercase tracking-wide text-gray-500 mb-2 block">DOI:</span>
                                <span class="id text-sm text-blue-600 font-serif break-all">
                                    <a href="{$doiUrl}" class="underline hover:text-blue-800">{$doiUrl}</a>
                                </span>
                            </div>
                        {/if}
                    </div>
                {/if}
            </aside>
        </div>
    </div>
</div>
