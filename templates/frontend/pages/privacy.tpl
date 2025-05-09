{**
 * templates/frontend/pages/privacy.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the privacy policy.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="manager.setup.privacyStatement"}

{capture assign="breadcrumbsHtml"}
  {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="manager.setup.privacyStatement"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="manager.setup.privacyStatement"}}

<section class="bg-white py-12">
  <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div>
      <div class="text-gray-700">
        {$currentContext->getLocalizedSetting('privacyStatement')}
      </div>
    </div>
  </div>
</section><!-- .page -->

{include file="frontend/components/footer.tpl"}
