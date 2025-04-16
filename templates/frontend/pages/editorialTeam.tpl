{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.editorialTeam"}

{capture assign="breadcrumbsHtml"}
  {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.editorialTeam"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="about.editorialTeam"}}

<section class="bg-white py-12">
  <div class="container mx-auto">
    <div class="grid">
      <div class="col-span-1">
        {$currentContext->getLocalizedSetting('editorialTeam')}
        {include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="editorialTeam" sectionTitleKey="about.editorialTeam"}
      </div>
    </div>
  </div>
</section>

{include file="frontend/components/footer.tpl"}
