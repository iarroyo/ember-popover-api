import { pageTitle } from 'ember-page-title';
import Tooltip from 'ember-popover-api/components/tooltip';

<template>
  {{pageTitle "Popover API + CSS Anchor Positioning"}}

  <div class="min-h-screen bg-slate-100 p-8">
    <div class="mx-auto max-w-3xl">

      {{! Header }}
      <div class="mb-10 text-center">
        <h1 class="text-3xl font-bold text-slate-800">
          Tooltip — Popover API + CSS Anchor Positioning
        </h1>
        <p class="mt-2 text-slate-500">
          Hover or focus any button to see the tooltip. Fallback positions kick
          in automatically when the preferred side has insufficient space.
        </p>
      </div>

      {{! ── Placement demo ─────────────────────────────────── }}
      <section class="mb-10">
        <h2 class="mb-4 text-lg font-semibold text-slate-700">Placements</h2>

        <div
          class="flex flex-wrap items-center justify-center gap-6 rounded-xl bg-white p-10 shadow-sm"
        >

          <Tooltip @content="Tooltip on top" @placement="top">
            <button
              type="button"
              class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            >
              Top
            </button>
          </Tooltip>

          <Tooltip @content="Tooltip on bottom" @placement="bottom">
            <button
              type="button"
              class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            >
              Bottom
            </button>
          </Tooltip>

          <Tooltip @content="Tooltip on the left" @placement="left">
            <button
              type="button"
              class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            >
              Left
            </button>
          </Tooltip>

          <Tooltip @content="Tooltip on the right" @placement="right">
            <button
              type="button"
              class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-indigo-600"
            >
              Right
            </button>
          </Tooltip>

        </div>
      </section>

      {{! ── Fallback position demo ──────────────────────────── }}
      <section class="mb-10">
        <h2 class="mb-2 text-lg font-semibold text-slate-700">Fallback positions</h2>
        <p class="mb-4 text-sm text-slate-500">
          All four buttons below prefer
          <strong>top</strong>
          placement, but the ones near the viewport edge flip automatically to
          the next available side via
          <code
            class="rounded bg-slate-100 px-1 font-mono text-xs"
          >position-try-fallbacks</code>.
        </p>

        <div class="relative h-72 rounded-xl bg-white shadow-sm">

          {{! Top-left corner → fallback to bottom-right }}
          <div class="absolute left-2 top-2">
            <Tooltip
              @content="Prefers top, falls back as needed"
              @placement="top"
            >
              <button
                type="button"
                class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              >
                Top-left
              </button>
            </Tooltip>
          </div>

          {{! Top-right corner }}
          <div class="absolute right-2 top-2">
            <Tooltip
              @content="Prefers top, falls back as needed"
              @placement="top"
            >
              <button
                type="button"
                class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              >
                Top-right
              </button>
            </Tooltip>
          </div>

          {{! Bottom-left corner }}
          <div class="absolute bottom-2 left-2">
            <Tooltip
              @content="Prefers bottom, falls back as needed"
              @placement="bottom"
            >
              <button
                type="button"
                class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              >
                Bottom-left
              </button>
            </Tooltip>
          </div>

          {{! Bottom-right corner }}
          <div class="absolute bottom-2 right-2">
            <Tooltip
              @content="Prefers bottom, falls back as needed"
              @placement="bottom"
            >
              <button
                type="button"
                class="rounded-lg bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white shadow hover:bg-emerald-700"
              >
                Bottom-right
              </button>
            </Tooltip>
          </div>

          {{! Centre }}
          <div class="absolute inset-0 flex items-center justify-center">
            <Tooltip @content="Plenty of space — stays on top" @placement="top">
              <button
                type="button"
                class="rounded-lg bg-violet-600 px-4 py-2 text-sm font-medium text-white shadow hover:bg-violet-700"
              >
                Centre (top)
              </button>
            </Tooltip>
          </div>

        </div>
      </section>

      {{! ── Inline text example ────────────────────────────── }}
      <section>
        <h2 class="mb-4 text-lg font-semibold text-slate-700">Inline text</h2>
        <p
          class="rounded-xl bg-white p-6 text-slate-700 shadow-sm leading-relaxed"
        >
          The Popover API is a new browser primitive that puts elements into the
          <Tooltip
            @content="The top layer sits above everything else in the page."
            @placement="top"
          >
            <span
              class="cursor-help border-b border-dashed border-indigo-400 text-indigo-600"
            >top layer</span>
          </Tooltip>
          so they don't need
          <Tooltip
            @content="z-index stacking is notoriously hard to manage."
            @placement="bottom"
          >
            <span
              class="cursor-help border-b border-dashed border-indigo-400 text-indigo-600"
            >z-index hacks</span>
          </Tooltip>. Combined with CSS Anchor Positioning it can be positioned
          <Tooltip
            @content="anchor() resolves the anchor element's geometry at layout time."
            @placement="right"
          >
            <span
              class="cursor-help border-b border-dashed border-indigo-400 text-indigo-600"
            >relative to any anchor</span>
          </Tooltip>
          without JavaScript layout calculations.
        </p>
      </section>

    </div>
  </div>

  {{outlet}}
</template>
