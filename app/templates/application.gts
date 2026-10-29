import { pageTitle } from 'ember-page-title';
import anchorName from 'ember-popover-api/modifiers/anchor-name';
import anchorPositioned from 'ember-popover-api/modifiers/anchor-positioned';
import hoverTrigger from 'ember-popover-api/modifiers/hover-trigger';

<template>
  {{pageTitle "Popover API + CSS Anchor Positioning"}}

  <div class="min-h-screen bg-slate-100 p-8">
    <div class="mx-auto max-w-3xl space-y-10">

      {{! Header }}
      <div class="text-center">
        <h1 class="text-3xl font-bold text-slate-800">
          Popover API + CSS Anchor Positioning
        </h1>
        <p class="mt-2 text-slate-500">
          Plain HTML elements enhanced with modifiers — no wrapper component.
        </p>
      </div>

      {{! ── Tooltips (hover) ─────────────────────────────── }}
      <section>
        <h2 class="mb-1 text-lg font-semibold text-slate-700">
          Tooltips
          <span class="ml-2 text-sm font-normal text-slate-400">
            popover="manual" + hoverTrigger
          </span>
        </h2>
        <p class="mb-4 text-sm text-slate-500">
          The trigger gets
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >anchorName</code>
          +
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >hoverTrigger</code>. The popover gets
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >anchorPositioned</code>.
        </p>

        <div
          class="flex flex-wrap items-center justify-center gap-6 rounded-xl bg-white p-10 shadow-sm"
        >
          {{! top }}
          <button
            type="button"
            aria-describedby="tt-top"
            class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            {{anchorName "tt-top"}}
            {{hoverTrigger "tt-top"}}
          >Top</button>
          <div
            id="tt-top"
            role="tooltip"
            popover="manual"
            class="tooltip"
            {{anchorPositioned "tt-top" placement="top"}}
          >Tooltip on top</div>

          {{! bottom }}
          <button
            type="button"
            aria-describedby="tt-bottom"
            class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            {{anchorName "tt-bottom"}}
            {{hoverTrigger "tt-bottom"}}
          >Bottom</button>
          <div
            id="tt-bottom"
            role="tooltip"
            popover="manual"
            class="tooltip"
            {{anchorPositioned "tt-bottom" placement="bottom"}}
          >Tooltip on bottom</div>

          {{! left }}
          <button
            type="button"
            aria-describedby="tt-left"
            class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            {{anchorName "tt-left"}}
            {{hoverTrigger "tt-left"}}
          >Left</button>
          <div
            id="tt-left"
            role="tooltip"
            popover="manual"
            class="tooltip"
            {{anchorPositioned "tt-left" placement="left"}}
          >Tooltip on the left</div>

          {{! right }}
          <button
            type="button"
            aria-describedby="tt-right"
            class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            {{anchorName "tt-right"}}
            {{hoverTrigger "tt-right"}}
          >Right</button>
          <div
            id="tt-right"
            role="tooltip"
            popover="manual"
            class="tooltip"
            {{anchorPositioned "tt-right" placement="right"}}
          >Tooltip on the right</div>
        </div>
      </section>

      {{! ── Popovers (click) ─────────────────────────────── }}
      <section>
        <h2 class="mb-1 text-lg font-semibold text-slate-700">
          Popovers
          <span class="ml-2 text-sm font-normal text-slate-400">
            popover="auto" + native popovertarget
          </span>
        </h2>
        <p class="mb-4 text-sm text-slate-500">
          Click triggers use the native
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >popovertarget</code>
          attribute — no JS needed for show/hide. Only
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >anchorName</code>
          +
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >anchorPositioned</code>
          are required for positioning.
        </p>

        <div
          class="flex flex-wrap items-center justify-center gap-6 rounded-xl bg-white p-10 shadow-sm"
        >
          {{! below }}
          <button
            type="button"
            popovertarget="pop-below"
            class="rounded-lg bg-violet-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-violet-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-violet-600"
            {{anchorName "pop-below"}}
          >Open below ↓</button>
          <div
            id="pop-below"
            popover
            class="popover-panel"
            {{anchorPositioned "pop-below" placement="bottom"}}
          >
            <p class="mb-2 font-semibold text-slate-800">Popover (auto)</p>
            <p class="text-sm text-slate-600">
              Click outside or press
              <kbd
                class="rounded border border-slate-300 px-1 text-xs"
              >Esc</kbd>
              to dismiss.
            </p>
          </div>

          {{! above }}
          <button
            type="button"
            popovertarget="pop-above"
            class="rounded-lg bg-violet-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-violet-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-violet-600"
            {{anchorName "pop-above"}}
          >Open above ↑</button>
          <div
            id="pop-above"
            popover
            class="popover-panel"
            {{anchorPositioned "pop-above" placement="top"}}
          >
            <p class="mb-2 font-semibold text-slate-800">Popover (auto)</p>
            <p class="text-sm text-slate-600">Opens above the trigger.</p>
          </div>
        </div>
      </section>

      {{! ── Fallback positions ───────────────────────────── }}
      <section>
        <h2 class="mb-1 text-lg font-semibold text-slate-700">
          Fallback positions
        </h2>
        <p class="mb-4 text-sm text-slate-500">
          Buttons near the edge prefer
          <strong>top</strong>, but flip via
          <code
            class="rounded bg-slate-200 px-1 font-mono text-xs"
          >position-try-fallbacks</code>
          when there is no space.
        </p>

        <div class="relative h-72 rounded-xl bg-white shadow-sm">

          <div class="absolute left-2 top-2">
            <button
              type="button"
              class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              {{anchorName "fb-tl"}}
              {{hoverTrigger "fb-tl"}}
            >Top-left</button>
            <div
              id="fb-tl"
              role="tooltip"
              popover="manual"
              class="tooltip"
              {{anchorPositioned "fb-tl" placement="top"}}
            >Prefers top</div>
          </div>

          <div class="absolute right-2 top-2">
            <button
              type="button"
              class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              {{anchorName "fb-tr"}}
              {{hoverTrigger "fb-tr"}}
            >Top-right</button>
            <div
              id="fb-tr"
              role="tooltip"
              popover="manual"
              class="tooltip"
              {{anchorPositioned "fb-tr" placement="top"}}
            >Prefers top</div>
          </div>

          <div class="absolute bottom-2 left-2">
            <button
              type="button"
              class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              {{anchorName "fb-bl"}}
              {{hoverTrigger "fb-bl"}}
            >Bottom-left</button>
            <div
              id="fb-bl"
              role="tooltip"
              popover="manual"
              class="tooltip"
              {{anchorPositioned "fb-bl" placement="bottom"}}
            >Prefers bottom</div>
          </div>

          <div class="absolute bottom-2 right-2">
            <button
              type="button"
              class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              {{anchorName "fb-br"}}
              {{hoverTrigger "fb-br"}}
            >Bottom-right</button>
            <div
              id="fb-br"
              role="tooltip"
              popover="manual"
              class="tooltip"
              {{anchorPositioned "fb-br" placement="bottom"}}
            >Prefers bottom</div>
          </div>

          <div class="absolute inset-0 flex items-center justify-center">
            <button
              type="button"
              class="rounded-lg bg-violet-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-violet-700"
              {{anchorName "fb-center"}}
              {{hoverTrigger "fb-center"}}
            >Centre (top)</button>
            <div
              id="fb-center"
              role="tooltip"
              popover="manual"
              class="tooltip"
              {{anchorPositioned "fb-center" placement="top"}}
            >Plenty of space</div>
          </div>

        </div>
      </section>

    </div>
  </div>

  {{outlet}}
</template>
