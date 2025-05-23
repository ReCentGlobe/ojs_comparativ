{**
 * templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of a galley object as a link to view or download the galley, to be used
 *  in a list of galleys.
 *
 * @uses $galley Galley
 * @uses $parent Issue|Article Object which these galleys are attached to
 * @uses $isSupplementary bool Is this a supplementary file?
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $restrictOnlyPdf bool Is access only restricted to PDF galleys?
 * @uses $purchaseArticleEnabled bool Can this article be purchased?
 * @uses $currentJournal Journal The current journal context
 * @uses $journalOverride Journal An optional argument to override the current
 *       journal with a specific context
 *}

{* Override the $currentJournal context if desired *}
{if $journalOverride}
    {assign var="currentJournal" value=$journalOverride}
{/if}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
    {assign var="type" value="pdf"}
{else}
    {assign var="type" value="file"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
    {assign var="page" value="issue"}
    {assign var="parentId" value=$parent->getBestIssueId()}
{else}
    {assign var="page" value="article"}
    {assign var="parentId" value=$parent->getBestId()}
{/if}

{* Get user access flag *}
{if !$hasAccess}
    {if $restrictOnlyPdf && $type=="pdf"}
        {assign var=restricted value="1"}
    {elseif !$restrictOnlyPdf}
        {assign var=restricted value="1"}
    {/if}
{/if}



{* Don't be frightened. This is just a link *}
<a class="inline-block px-3 py-1 rounded border border-primary text-primary bg-white hover:bg-primary hover:text-white text-xs font-medium transition-colors {if $isSupplementary}bg-gray-100 border-gray-300 text-gray-700{else}com-galley_link{/if} {$type}{if $restricted} bg-red-100 border-red-400 text-red-700 restricted{/if}" href="{url page=$page op="view" path=$parentId|to_array:$galley->getBestGalleyId()}">
    {* Add some screen reader text to indicate if a galley is restricted *}
    {if $restricted}
		<span class="sr-only">
			{if $purchaseArticleEnabled}
                {translate key="reader.subscriptionOrFeeAccess"}
            {else}
                {translate key="reader.subscriptionAccess"}
            {/if}
		</span>
    {/if}

    {$galley->getGalleyLabel()|escape}

    {if $restricted && $purchaseFee && $purchaseCurrency}
		<span class="purchase_cost ml-2 text-xs text-gray-500">
			{translate key="reader.purchasePrice" price=$purchaseFee currency=$purchaseCurrency}
		</span>
    {/if}
</a>
