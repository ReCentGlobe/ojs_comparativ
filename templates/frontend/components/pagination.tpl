{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

{if $prevUrl || $nextUrl}
  <ul class="uk-pagination" aria-label="{translate|escape key="common.pagination.label"}">
    {if $prevUrl}
      <li class="uk-margin-auto-right">
       <a href="{$prevUrl}"><span class="uk-margin-small-right" uk-pagination-previous></span>{translate key="help.previous"}</a>
      </li>
    {/if}
    <span class="current">
			{translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}
		</span>
    {if $nextUrl}
      <li class="uk-margin-auto-left">
        <a href="{$nextUrl}">{translate key="help.next"}<span class="uk-margin-small-left" uk-pagination-next></span></a>
      </li>
    {/if}
  </ul>
{/if}
