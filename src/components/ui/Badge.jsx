const variants = {
  active: 'bg-green-100 text-green-800',
  inactive: 'bg-gray-100 text-gray-600',
  on_leave: 'bg-yellow-100 text-yellow-800',
  regular_member: 'bg-blue-100 text-blue-800',
  associate_member: 'bg-purple-100 text-purple-800',
  regular: 'bg-gray-100 text-gray-700',
  non_regular: 'bg-orange-100 text-orange-700',
}

export default function Badge({ value, label }) {
  const cls = variants[value] ?? 'bg-gray-100 text-gray-700'
  return (
    <span className={`inline-block text-xs font-medium px-2 py-0.5 rounded-full ${cls}`}>
      {label ?? value?.replace(/_/g, ' ')}
    </span>
  )
}
