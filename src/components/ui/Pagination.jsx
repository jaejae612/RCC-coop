/**
 * Reusable pagination bar.
 *
 * Props:
 *   page      – current page (1-based)
 *   pageSize  – rows per page
 *   total     – total row count (unfiltered if you want; pass filtered.length)
 *   onChange  – (newPage: number) => void
 */
export default function Pagination({ page, pageSize, total, onChange }) {
  const totalPages = Math.ceil(total / pageSize)
  if (totalPages <= 1) return null

  const from = (page - 1) * pageSize + 1
  const to   = Math.min(page * pageSize, total)

  // Build visible page numbers with ellipsis
  function pageList() {
    const result = []
    for (let i = 1; i <= totalPages; i++) {
      if (i === 1 || i === totalPages || Math.abs(i - page) <= 1) {
        result.push(i)
      } else if (result[result.length - 1] !== '…') {
        result.push('…')
      }
    }
    return result
  }

  return (
    <div className="flex items-center justify-between mt-4 px-1 no-print">
      <p className="text-xs text-gray-400">
        {from}–{to} of {total}
      </p>
      <div className="flex gap-1 flex-wrap">
        <button
          onClick={() => onChange(page - 1)}
          disabled={page === 1}
          className="px-2.5 py-1.5 text-sm rounded border border-gray-200 text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          ‹
        </button>

        {pageList().map((p, i) =>
          p === '…' ? (
            <span key={`e${i}`} className="px-2 py-1.5 text-sm text-gray-400">
              …
            </span>
          ) : (
            <button
              key={p}
              onClick={() => onChange(p)}
              className={`px-2.5 py-1.5 text-sm rounded border transition-colors ${
                p === page
                  ? 'bg-blue-600 text-white border-blue-600'
                  : 'border-gray-200 text-gray-600 hover:bg-gray-50'
              }`}
            >
              {p}
            </button>
          )
        )}

        <button
          onClick={() => onChange(page + 1)}
          disabled={page === totalPages}
          className="px-2.5 py-1.5 text-sm rounded border border-gray-200 text-gray-600 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed"
        >
          ›
        </button>
      </div>
    </div>
  )
}
