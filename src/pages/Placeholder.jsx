export default function Placeholder({ title }) {
  return (
    <div className="flex items-center justify-center h-64">
      <div className="text-center">
        <p className="text-2xl mb-2">🚧</p>
        <p className="font-semibold text-gray-700">{title}</p>
        <p className="text-sm text-gray-400 mt-1">Coming in the next phase</p>
      </div>
    </div>
  )
}
