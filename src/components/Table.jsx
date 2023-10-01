export default function Table({ obj }) {
  return <pre>{JSON.stringify(obj, null, 4)}</pre>
}
