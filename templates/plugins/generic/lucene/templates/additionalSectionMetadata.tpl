{**
 * templates/additionalSectionMetadata.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * A template to be included via Templates::Manager::Sections::SectionForm::AdditionalMetadata hook.
 *}
<div class="pkp_helpers_clear"></div>
<div class="my-4">
    <tr>
        <td class="font-semibold pr-2">{fieldLabel name="rankingBoost" key="plugins.generic.lucene.sectionForm.rankingBoost"}</td>
        <td>
            <span class="text-xs text-gray-500">{translate key="plugins.generic.lucene.sectionForm.rankingBoostInstructions"}</span><br />
            <p><select name="rankingBoostOption" size="1" id="rankingBoostOption" class="border rounded px-2 py-1">
                {html_options options=$rankingBoostOptions selected=$rankingBoostOption}
            </select></p>
        </td>
    </tr>
</div>
